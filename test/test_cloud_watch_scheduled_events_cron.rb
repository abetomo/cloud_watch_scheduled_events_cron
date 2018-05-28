require 'test/unit'
require 'cloud_watch_scheduled_events_cron'

class TestCloudWatchScheduledEventsCron < Test::Unit::TestCase
  def test_cron_expressions
    tests = [{
        expected: '0 10 * * ? *',
        cron_expressions: '0 10 * * *'
    }, {
        expected: '15 12 * * ? *',
        cron_expressions: '15 12 * * *'
    }, {
        expected: '0 18 ? * MON-FRI *',
        cron_expressions: '0 18 * * 1-5'
    }, {
        expected: '0 8 1 * ? *',
        cron_expressions: '0 8 1 * *'
    }, {
        expected: '0/15 * * * ? *',
        cron_expressions: '0/15 * * * *'
    }, {
        expected: '0/10 * ? * MON-FRI *',
        cron_expressions: '0/10 * * * 1-5'
    }, {
        expected: '0/5 8-17 ? * MON-FRI *',
        cron_expressions: '0/5 8-17 * * 1-5'
    }]
    tests.each do |t|
      assert_equal(
        t[:expected],
        CloudWatchScheduledEventsCron::Converter::cron_expressions(t[:cron_expressions]),
        t
      )
    end
  end

  def test_parse_cron_expressions
    assert_equal(
      {
          minute: '1',
          hour: '2',
          day: '*',
          month: '12',
          wday: '0'
      },
      CloudWatchScheduledEventsCron::Converter::parse_cron_expressions('1 2 * 12 0')
    )
  end

  def test_day_with_asterisk
    assert_equal(
      '*',
      CloudWatchScheduledEventsCron::Converter::day({
        day: '*',
        wday: '*'
      })
    )
    assert_equal(
      '?',
      CloudWatchScheduledEventsCron::Converter::day({
        day: '*',
        wday: 'MON'
      })
    )
  end

  def test_wday_with_asterisk
    assert_equal(
      '?',
      CloudWatchScheduledEventsCron::Converter::wday({wday: '*'})
    )
  end

  def test_wday_with_hyphen
    assert_equal(
      'MON-FRI',
      CloudWatchScheduledEventsCron::Converter::wday({wday: '1-5'})
    )
  end
end
