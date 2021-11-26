require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'logger'
require File.join(File.dirname(__FILE__), 'environment')

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
  # logger.error "bad request"
  halt(405, { error: 'HTTP POST request expected'}.to_json)
end

post '/' do

  github_request = Request.new(request, ENV['SECRET_TOKEN'])

  if github_request.valid?
    case github_request.request_event
      when 'push'
        event = Github::Event.new(github_request.request_json)
        puts "event.branch: #{event.branch}"
        puts "event.repository.name: #{event.repository.name}"
        {'message': 'success!'}.to_json
      else
        return nil
    end
  else
    return halt 500, {error: github_request.error_message}.to_json
  end
end
