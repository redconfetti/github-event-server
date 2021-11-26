# Github Event Server

**Note:** This project is under construction and not ready for use.

[Sinatra] application used to processing events posted by [Github Web-hooks].

Built for specific purpose of receiving 'push' events from Github, and
then running a static site build process on the same server, likely via a
shell script with SUID execution bit.

[Sinatra]: http://sinatrarb.com/documentation.html

## Configuration

- Dependencies / configuration in `environment.rb`
- Controller in `application.rb`
- Models auto-loaded from `lib` directory
- Environment variables defined in `.env`

## Testing

See [Testing](docs/testing.md)

## Getting Started

You can run the Sinatra app using `rackup` or run it using Foreman:

```bash
bundle install
bundle exec foreman start
```

## Console

Use `rake console` to open IRB with the environment loaded.

## Resources

- Github
  - [Github Web-hooks]
  - [Github Event Types]
- Ruby / Rack
  - [How to use Bundler with Ruby]
  - [Rack Request]
- Sinatra
  - [Sinatra Configuration]
  - [Sinatra Logging]
  - [Sinatra Applications with Rspec]
  - [A Simple Sinatra App to Receive Github Webhook Payload]
  - [sinatra-template] provides example Sinatra app with Rspec tests
  - [Sinatra App with Rspec]
- Misc
  - [PipeDream] - HTTP request capture

[sinatra-template]: https://github.com/zapnap/sinatra-template
[Github Web-hooks]: https://docs.github.com/en/developers/webhooks-and-events/webhooks
[Github Event Types]: https://docs.github.com/en/developers/webhooks-and-events/events/github-event-types#pushevent
[A Simple Sinatra App to Receive Github Webhook Payload]: https://blog.arangamani.net/blog/2014/04/16/a-simple-sinatra-app-to-receive-github-webhook-payload/
[How to use Bundler with Ruby]: https://bundler.io/v2.2/guides/bundler_setup.html
[Sinatra Applications with Rspec]: http://www.shiroyasha.io/sinatra-app-with-rspec.html
[Rack Request]: https://rubydoc.info/github/rack/rack/master/Rack/Request
[PipeDream]: https://pipedream.com/
[Sinatra Logging]: https://spin.atomicobject.com/2013/11/12/production-logging-sinatra/
[Sinatra Configuration]: http://sinatrarb.com/configuration.html
[Sinatra App with Rspec]: https://shiroyasha.io/sinatra-app-with-rspec.html

## Deployment

This application to deployed to production using [Capistrano], with
primary configuration in `config/deploy.rb`.

```shell
# View Capistrano tasks
bundle exec cap -T

# Deploy update to production
bundle exec cap production deploy
```

[Capistrano]: https://github.com/capistrano/capistrano/blob/master/README.md
