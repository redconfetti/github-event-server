require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)

Dotenv.load

configure do
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/**/*.rb") { |lib| require(lib) }
end
