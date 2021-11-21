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
end
