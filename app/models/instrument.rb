class Instrument < ApplicationRecord
  has_many :funding_rates

  def hourly_rate(exchange)
    time = Time.now

    funding_rate = FundingRate.where(
      exchange: exchange,
      instrument: self,
      created_at: time.beginning_of_hour..time.end_of_hour
    ).last

    funding_rate ? funding_rate.rate : 0
  end
end
