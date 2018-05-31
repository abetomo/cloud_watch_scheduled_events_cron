require "cloud_watch_scheduled_events_cron/version"

# TODO
# Supports all cases since it only supports the following document examples.
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html

module CloudWatchScheduledEventsCron
  class Converter
    WDAY = [
      'SUN',
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT',
      'SUN',
    ]

    def self.cron_expressions(crontab_expressions)
      schedule = parse_cron_expressions(crontab_expressions)
      return '%s %s %s %s %s *' % [
        schedule[:minute],
        schedule[:hour],
        day(schedule),
        schedule[:month],
        wday(schedule)
      ]
    end

    def self.parse_cron_expressions(crontab_expressions)
      schedule = crontab_expressions.split(/\s+/)
      return {
        minute: schedule[0],
        hour: schedule[1],
        day: schedule[2],
        month: schedule[3],
        wday: schedule[4]
      }
    end

    def self.day(schedule)
      if schedule[:day] != '*'
        return schedule[:day]
      end
      if schedule[:wday] == '*'
        return '*'
      end
      return '?'
    end

    def self.wday(schedule)
      if schedule[:wday] == '*'
        return '?'
      end

      # TODO
      # other than hyphen
      schedule[:wday].split(/-/).map{|wday|
        WDAY[wday.to_i]
      }.join('-')
    end
  end
end
