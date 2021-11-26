require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  describe 'GET /' do
    it 'returns HTTP POST expected error' do
      get '/'
      expect(last_response.status).to eq 405
      body = JSON.parse(last_response.body)
      expect(body['error']).to eq 'HTTP POST request expected'
    end
  end

  describe 'POST /' do
    let(:github_signature) { nil }
    let(:secret_token) { 'abcd1234abcd5678efgh' }
    let(:github_event_post_body) { attributes_for(:github_event) }

    before do
      ENV['SECRET_TOKEN'] = secret_token
      header 'content-type', 'application/json'
      header 'x-github-event', github_event_type
      header 'x-hub-signature-256', github_signature
    end

    context 'when github event type is supported' do
      let(:github_event_type) { 'push' }

      context 'when github token does not match secret' do
        let(:github_signature) { 'sha256=63c72fa9529a94baa9dcc063920' }

        it 'returns error response' do
          post '/', github_event_post_body.to_json, { 'CONTENT_TYPE' => 'application/json' }
          expect(last_response.status).to eq 500
          body = JSON.parse(last_response.body)
          expect(body['error']).to eq 'Request signature for \'x-hub-signature-256\' does not match'
        end
      end

      context 'when github signature matches secret token' do
        let(:github_signature) { 'sha256=6259170b65ed45419afad5bc2c0156a31c059847746046228b3db3ea4de33daf' }
        it 'processes request' do
          # puts "body: #{github_event_post_body.inspect}"
          post '/', github_event_post_body.to_json, { 'CONTENT_TYPE' => 'application/json' }
          expect(last_response.status).to eq 200
          body = JSON.parse(last_response.body)
          puts "body: #{body.inspect}"

        end
      end
    end

  end
end
