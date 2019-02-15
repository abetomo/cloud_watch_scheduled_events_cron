# CloudWatchScheduledEventsCron

[![Gem Version](https://badge.fury.io/rb/cloud_watch_scheduled_events_cron.svg)](https://badge.fury.io/rb/cloud_watch_scheduled_events_cron)

Convert crontab expression to CloudWatch expression.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloud_watch_scheduled_events_cron'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install cloud_watch_scheduled_events_cron
```

## Usage

Convert standard output.

```
$ echo '0 10 * * *' | to_cwcec
0 10 * * ? *
$ echo '5 * * * 1-5' | to_cwcec
5 * ? * MON-FRI *
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abetomo/cloud_watch_scheduled_events_cron.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
