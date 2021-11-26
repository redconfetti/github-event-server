class Request
  attr_reader :request, :secret

  def initialize(rack_request, secret_key)
    @request = rack_request
    @secret = secret_key
  end

  def error_message
    return 'Request signature for \'x-hub-signature-256\' does not match' unless signature_valid?
    return "The event type '#{request_event}' is not supported" unless event_supported?
  end

  def event_supported?
    Github::Event::TYPES_SUPPORTED.include?(request_event)
  end

  def request_body
    @request_body ||= request.body.read
  end

  def request_event
    request.env['HTTP_X_GITHUB_EVENT']
  end

  def request_json
    if request_body.to_s.length <= 0
      {}
    else
      JSON.parse(request_body)
    end
  end

  def request_signature
    request.env['HTTP_X_HUB_SIGNATURE_256']
  end

  def signature
    'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), secret, request_body)
  end

  def signature_valid?
    Rack::Utils.secure_compare(signature, request_signature)
  end

  def valid?
    signature_valid? && event_supported?
  end
end
