class CleanupOldFundingRateJob < ApplicationJob
  queue_as :default

  def perform(instrument)
    CleanupOldFundingRateService.run(instrument)
  end
end
