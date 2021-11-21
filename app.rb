require 'sinatra'

# class EventApi < Sinatra::Base

# end

set :port, 5000

post '/' do
  event = request.env['HTTP_X_GITHUB_EVENT']
  case event
    when 'push'
      payload_body = request.body.read
      verify_signature(payload_body)
      payload = JSON.parse(request.body.read)

      repo = payload['repository']['full_name']
      user = payload['sender']['login']
      user_url = payload['sender']['html_url']
      puts "This is a watch event on '#{repo}' by '#{user}': #{user_url}"

    else
      puts "Received '#{event}' type event, which is not currently supported"
  end
end

def verify_signature(payload_body)
  puts "ENV['SECRET_TOKEN']: #{ENV['SECRET_TOKEN'].inspect}"
  signature = 'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['SECRET_TOKEN'], payload_body)
  return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE_256'])
end
