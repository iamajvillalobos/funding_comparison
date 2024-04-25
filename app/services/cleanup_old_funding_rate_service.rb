class CleanupOldFundingRateService
  def self.run(instrument)
    instrument.funding_rates.where("created_at < ?", 1.hour.ago).delete_all
  end
end
