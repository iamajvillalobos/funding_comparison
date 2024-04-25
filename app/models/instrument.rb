class Instrument < ApplicationRecord
  has_many :funding_rates

  def hourly_rate(exchange)
    time = Time.now

    funding_rate = FundingRate.find_by(
      exchange: exchange,
      instrument: self,
      created_at: time.beginning_of_hour..time.end_of_hour
    )

    funding_rate ? funding_rate.rate : 0
  end
end
