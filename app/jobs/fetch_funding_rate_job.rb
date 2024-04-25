class FetchFundingRateJob < ApplicationJob
  queue_as :default

  def perform(exchange:, instrument:)
    FetchFundingRateService.run(exchange: exchange, instrument: instrument)
  end
end
