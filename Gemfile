source 'https://rubygems.org'
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Sinatra
# http://sinatrarb.com/documentation.html
gem 'sinatra'

# JSON
# JSON implementation as a Ruby extension in C
# https://flori.github.io/json/
gem 'json', '>= 1.8.3'

# DotEnv
# A Ruby gem to load environment variables from `.env`
# https://github.com/bkeepers/dotenv
gem 'dotenv'

# Rake
# A make-like build utility for Ruby.
# https://github.com/ruby/rake
gem 'rake'

group :development do
  # Foreman
  # Manages Procfile-based applications
  # https://github.com/ddollar/foreman
  gem 'foreman'

  # Capistrano
  # Remote multi-server automation tool
  # https://github.com/capistrano/capistrano
  gem "capistrano", "~> 3.16.0", require: false
end

group :test do
  # Rspec
  # RSpec runner and formatters
  # https://github.com/rspec/rspec-core
  gem 'rspec', :require => 'spec'

  # Rack Test
  # Rack::Test is a layer on top of Rack's MockRequest similar to Merb's RequestHelper
  # https://github.com/rack/rack-test
  gem 'rack-test'

  # Factory Bot
  # A library for setting up Ruby objects as test data.
  # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#rspec
  gem 'factory_bot'
end
