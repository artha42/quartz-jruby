require 'rubygems'
require 'active_support'
require 'active_support/core_ext'

# this stuff is based on whenver
# https://github.com/javan/whenever/

module Quartz
  class Cronify
    def self.comma_separated_timing(frequency, max, start = 0)
      return start     if frequency.blank? || frequency.zero?
      return frequency if frequency > (max * 0.5).ceil

      original_start = start

      start += frequency unless (max + 1).modulo(frequency).zero? || start > 0
      output = (start..max).step(frequency).to_a

      max_occurances = (max.to_f  / (frequency.to_f)).round
      max_occurances += 1 if original_start.zero?

      output[0, max_occurances].join(',')
    end


    def self.cronify(time,at=0)
      timing = %w(0 * * * * ?)
      case time
        when 0.seconds...1.minute
          timing[0] = "0/#{time.to_s}"
        when 1.minute...1.hour
          minute_frequency = time / 60
          timing[1] = comma_separated_timing(minute_frequency, 59, at || 0)
        when 1.hour...1.day
          hour_frequency = (time / 60 / 60).round
          timing[1] = at.is_a?(Time) ? at.min : at
          timing[2] = comma_separated_timing(hour_frequency, 23)
        when 1.day...1.month
          day_frequency = (time / 24 / 60 / 60).round
          timing[1] = at.is_a?(Time) ? at.min  : 0
          timing[2] = at.is_a?(Time) ? at.hour : at
          timing[3] = comma_separated_timing(day_frequency, 31, 1)
        when 1.month..12.months
          month_frequency = (time / 30  / 24 / 60 / 60).round
          timing[1] = at.is_a?(Time) ? at.min  : 0
          timing[2] = at.is_a?(Time) ? at.hour : 0
          timing[3] = at.is_a?(Time) ? at.day  : (at.zero? ? 1 : at)
          timing[4] = comma_separated_timing(month_frequency, 12, 1)
        else
          return 'bummer'
      end
      timing.join(' ')
    end
  end
end
