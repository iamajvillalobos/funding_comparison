class Hyperliquid
  include NanosecondsConversion
  include HTTParty
  base_uri 'api.hyperliquid.xyz'

  def funding(instrument)
    headers = {"Content-Type" => "application/json"}
    body = { "type" => "predictedFundings" }
    self.class.post("/info", headers: headers, body: body.to_json)
  end

  def save_funding_rate(response, exchange, instrument)
    token_details = response.find { |data| data[0] == instrument.name }

    return unless token_details

    perp_data = token_details.last.find { |data| data[0] == "HlPerp" }

    FundingRate.create!(
      rate: perp_data.last["fundingRate"],
      expire_at: milliseconds_to_datetime(perp_data.last["nextFundingTime"]),
      exchange: exchange,
      instrument: instrument
    )
  end
end