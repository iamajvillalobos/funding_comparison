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

  def milliseconds_to_datetime(milliseconds)
    seconds = milliseconds / 1000.0
    Time.at(seconds).utc.to_datetime
  end

  # Convert a DateTime to milliseconds since the Unix epoch
  def datetime_to_milliseconds(datetime)
    (datetime.to_time.to_f * 1000).to_i
  end
end