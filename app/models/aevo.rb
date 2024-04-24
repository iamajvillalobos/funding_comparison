class Aevo
  include NanosecondsConversion
  include HTTParty
  base_uri 'api.aevo.xyz'

  FundingRate = Struct.new(:rate, :expire_at)

  # returns the current funding rate for the instrument
  def funding(instrument)
    response = self.class.get("/funding", query: { instrument_name: "#{instrument}-PERP"})

    return response["error"] if response["error"]

    FundingRate.new(rate: response["funding_rate"], expire_at: nanoseconds_to_time(response["next_epoch"]))
  end

  def funding_history(instrument, start_time, end_time, limit = 50)
    instrument_name = "#{instrument}-PERP"
    start_time_epoch = time_to_nanoseconds(start_time)
    end_time_epoch = time_to_nanoseconds(end_time)

    query = {
      instrument_name: instrument_name,
      start_time: start_time_epoch,
      end_time: end_time_epoch,
      limit: limit
    }

    response = self.class.get("/funding-history", query: query)
    parse_response(response)
  end

  private

  def parse_response(response)
    return response if response["funding_history"].empty?

    response["funding_history"].map do |sym, time, rate, price|
      FundingRate.new(rate: rate, expire_at: nanoseconds_to_time(time))
    end
  end

end