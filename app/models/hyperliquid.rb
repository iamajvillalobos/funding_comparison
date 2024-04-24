class Hyperliquid
  include NanosecondsConversion
  include HTTParty
  base_uri 'api.hyperliquid.xyz'

  def funding(instrument)
    headers = {"Content-Type" => "application/json"}
    body = { "type" => "predictedFundings" }
    self.class.post("/info", headers: headers, body: body.to_json)
  end
end