require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'logger'
require File.join(File.dirname(__FILE__), 'environment')

::Logger.class_eval { alias :write :'<<' }
error_logger = ::File.new(::File.join(::File.dirname(::File.expand_path(__FILE__)),'.','log','error.log'),"a+")
error_logger.sync = true

before do
  env["rack.errors"] = error_logger
end

configure do
  enable :logging
end

configure :development do
  set :logging, Logger::DEBUG
end

configure :test do
  set :logging, Logger::ERROR
end

configure :production do
  set :logging, Logger::INFO
end

configure :production, :development do
  set :show_exceptions, :after_handler
end

helpers do
  # add your helpers here
end

get '/' do
  content_type 'application/json'
  logger.error "bad request"
  halt(405, { error: 'HTTP POST request expected'}.to_json)
end

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

  # content_type 'application/json'
  # {
  #   success: 'ok'
  # }.to_json
end

def verify_signature(payload_body)
  puts "ENV['SECRET_TOKEN']: #{ENV['SECRET_TOKEN'].inspect}"
  signature = 'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['SECRET_TOKEN'], payload_body)
  return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE_256'])
end
