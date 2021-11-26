source 'https://rubygems.org'
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'json', '>= 1.8.3'
gem 'dotenv'
gem 'rake'

group :development do
  gem 'foreman'

  # https://github.com/capistrano/capistrano
  gem "capistrano", "~> 3.16.0", require: false
end

group :test do

  # https://github.com/rspec/rspec-core
  gem 'rspec', :require => 'spec'

  # https://github.com/rack/rack-test
  gem 'rack-test'

  # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#rspec
  gem 'factory_bot'
end
