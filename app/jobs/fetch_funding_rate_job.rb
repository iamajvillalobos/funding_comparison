class FetchFundingRateJob < ApplicationJob
  queue_as :default

  def perform(exchange:, instrument:)
    client = exchange.name.camelize.constantize.new
    response = client.funding(instrument.name)

    if response.success?
      client.save_funding_rate(response, exchange, instrument)
    end
  end
end
