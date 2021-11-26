# Testing

You can run the test suite using these commands:

```bash
# via rake
rake spec

# standalone
rspec
```

## Rspec

The test suite uses [Rspec]

[Rspec]: https://github.com/rspec/rspec-core#basic-structure

## Rack Test

Request testing is supported by [Rack-Test], which facilitates web
requests.

```ruby
  header 'Accept-Charset', 'utf-8'
  get '/'

  assert last_response.ok?
  assert_equal last_response.body, 'All responses are OK'
```

[Rack-Test]: https://github.com/rack/rack-test#examples

## Factory Bot

Fixtures are supported by [Factory Bot]

[Factory Bot]: https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#rspec
