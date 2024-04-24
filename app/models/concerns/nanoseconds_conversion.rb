module NanosecondsConversion
  extend ActiveSupport::Concern

  def nanoseconds_to_time(nanoseconds)
    # Convert nanoseconds to seconds (float to maintain the fractional part)
    seconds = nanoseconds.to_i / 1_000_000_000.0

    # Convert seconds to a Time object
    Time.at(seconds).utc
  end

  def time_to_nanoseconds(datetime)
    time = Time.new(datetime.year, datetime.month, datetime.day, datetime.hour, datetime.min, datetime.sec)

    # Get seconds since epoch and convert to nanoseconds
    epoch_seconds = time.to_i
    epoch_nanoseconds = epoch_seconds * 1_000_000_000

    # Add additional nanoseconds from fractional seconds
    epoch_nanoseconds += time.usec * 1000
    
    epoch_nanoseconds
  end
end