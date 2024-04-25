class CleanupOldFundingRateService
  def self.run(instrument)
    instrument.funding_rates.where("created_at < ?", 12.minutes.ago).delete_all
  end
end
