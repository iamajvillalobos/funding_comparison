class Aevo
  include NanosecondsConversion
  include HTTParty
  base_uri 'api.aevo.xyz'

  # returns the current funding rate for the instrument
  def funding(instrument)
    self.class.get("/funding", query: { instrument_name: "#{instrument}-PERP"})
  end

  def save_funding_rate(response, exchange, instrument)
    binding.irb
    FundingRate.create!(
      rate: response["funding_rate"],
      expire_at: nanoseconds_to_time(response["next_epoch"]),
      exchange: exchange,
      instrument: instrument
    )
  end
end