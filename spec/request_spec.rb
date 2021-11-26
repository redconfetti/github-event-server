require "#{File.dirname(__FILE__)}/spec_helper"

describe Request do
  let(:secret_token) { 'abcd1234abcd5678efgh' }
  let(:github_request_signature) { 'sha256=6259170b65ed45419afad5bc2c0156a31c059847746046228b3db3ea4de33daf' }
  let(:github_event_type) { 'push' }
  let(:request_env) do
    {
      'HTTP_X_GITHUB_EVENT' => github_event_type,
      'HTTP_X_HUB_SIGNATURE_256' => github_request_signature,
    }
  end
  let(:request_body_content) { attributes_for(:github_event).to_json }
  let(:request_body) { double(:read => request_body_content) }
  let(:rack_request) do
    double(:rack_request, {
      env: request_env,
      body: request_body,
    })
  end
  subject { described_class.new(rack_request, secret_token) }

  describe '#error_message' do
    context 'when signature is not valid' do
      let(:github_request_signature) { 'sha256=6259170b65ed4' }
      it 'returns signature error' do
        expect(subject.error_message).to eq 'Request signature for \'x-hub-signature-256\' does not match'
      end
    end
    context 'when event type is not supported' do
      let(:github_event_type) { 'fork' }
      it 'returns unsupported event error' do
        expect(subject.error_message).to eq 'The event type \'fork\' is not supported'
      end
    end
    context 'when no errors are present' do
      it 'returns nil' do
        expect(subject.error_message).to eq nil
      end
    end
  end

  describe '#event_supported?' do
    context 'when event type is supported' do
      let(:github_event_type) { 'push' }
      it 'returns true' do
        expect(subject.event_supported?).to eq true
      end
    end

    context 'when event type is not supported' do
      let(:github_event_type) { 'fork' }
      it 'returns false' do
        expect(subject.event_supported?).to eq false
      end
    end
  end

  describe '#request_body' do
    it 'returns request body content' do
      expect(subject.request_body).to eq request_body_content
    end
  end

  describe '#request_event' do
    it 'returns github event type' do
      expect(subject.request_event).to eq 'push'
    end
  end

  describe '#request_json' do
    context 'when request body content is empty' do
      let(:request_body_content) { '' }
      it 'returns empty hash' do
        expect(subject.request_json).to eq({})
      end
    end
    context 'when request body content is present' do
      it 'returns hash' do
        result = subject.request_json
        expect(result).to be_an_instance_of Hash
        expect(result['ref']).to eq 'refs/heads/main'
      end
    end
  end

  describe '#request_signature' do
    it 'returns github request signature' do
      expect(subject.request_signature).to eq github_request_signature
    end
  end

  describe '#signature' do
    it 'returns signature for request body content' do
      result = subject.signature
      expect(result).to eq github_request_signature
    end
  end

  describe '#signature_valid?' do
    context 'when github signature matches calculated signature on request body' do
      let(:github_request_signature) { 'sha256=6259170b65ed45419afad5bc2c0156a31c059847746046228b3db3ea4de33daf' }
      it 'returns true' do
        expect(subject.signature_valid?).to eq true
      end
    end
    context 'when github signature does not match' do
      let(:github_request_signature) { 'sha256=6259170b65ed4' }
      it 'returns false' do
        expect(subject.signature_valid?).to eq false
      end
    end
  end

  describe '#valid?' do
    context 'when signature is not valid' do
      let(:github_request_signature) { 'sha256=6259170b65ed4' }
      it 'returns false' do
        expect(subject.valid?).to eq false
      end
    end
    context 'when event type is not supported' do
      let(:github_event_type) { 'fork' }
      it 'returns false' do
        expect(subject.valid?).to eq false
      end
    end
    context 'when no errors are present' do
      it 'returns true' do
        expect(subject.valid?).to eq true
      end
    end
  end
end
