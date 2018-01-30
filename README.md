# Omniauth::Barong

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/omniauth/barong`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-barong'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-barong

## Usage

`OmniAuth::Strategies::Barong` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :barong, ENV.fetch('BARONG_CLIENT_ID'), ENV.fetch('BARONG_CLIENT_SECRET')
end
```

## Configuration

You can configure several options, which you pass in to the `provider` method via a hash:

* `callback_url`(default: `your-application-url/auth/barong/callback`): Override callback_url used by barong server.
* `domain`(default: `barong.io`): Barong server domain where your application is configured.
* `use_https`(default: `true`) Enable https on your barong sever redirection (disable for test purpose).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-barong.
