# Github Event Server

Simple server used to processing events posted by [Github Web-hooks].

This tool is developed in Ruby with the light-weight [Sinatra] framework.

Testing is facilitated with RSpec / [RSpec-Sinatra]

[Sinatra]: http://sinatrarb.com/documentation.html
[RSpec-Sinatra]: https://github.com/tansaku/rspec-sinatra

## Resources

* [sinatra-template] provides example Sinatra app with Rspec tests
* [Github Web-hooks]
* [A Simple Sinatra App to Receive Github Webhook Payload]
* [How to use Bundler with Ruby]
* [Sinatra Applications with Rspec]
* [Rack Request]
* [PipeDream] - HTTP request capture
* [Sinatra Logging]

[sinatra-template]: https://github.com/zapnap/sinatra-template
[Github Web-hooks]: https://docs.github.com/en/developers/webhooks-and-events/webhooks
[A Simple Sinatra App to Receive Github Webhook Payload]: https://blog.arangamani.net/blog/2014/04/16/a-simple-sinatra-app-to-receive-github-webhook-payload/
[How to use Bundler with Ruby]: https://bundler.io/v2.2/guides/bundler_setup.html
[Sinatra Applications with Rspec]: http://www.shiroyasha.io/sinatra-app-with-rspec.html
[Rack Request]: https://rubydoc.info/github/rack/rack/master/Rack/Request
[PipeDream]: https://pipedream.com/
[Sinatra Logging]: https://spin.atomicobject.com/2013/11/12/production-logging-sinatra/

## Configuration

Dependencies and all configuration is done in <tt>environment.rb</tt>.

Add your controller actions in <tt>application.rb</tt>.
Models go in the <tt>lib</tt> directory and are auto-loaded.

Environment variables that you want to expose to your application can be added
in <tt>.env</tt>

## Testing

Add your specs in <tt>spec</tt>; just require <tt>spec_helper.rb</tt> to
pre-configure the test environment. A number of samples are provided (including
a sample model, which can be removed). To run the specs:

    bundle exec rake spec

## Getting Started

    bundle install
    bundle exec foreman start

## Extras

We've included a handy <tt>console</tt> script that fires up irb with your
environment loaded. To load it, use the Rake task:

    bundle exec rake console
