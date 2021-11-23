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
  gem 'rspec', :require => 'spec'
  gem 'rack-test'
  # gem 'rspec-sinatra'
end
