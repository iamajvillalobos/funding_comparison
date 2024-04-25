class CleanupOldFundingRatesService
  def self.run
    Instrument.all.each do |instrument|
      CleanupOldFundingRateJob.perform_later(instrument)
    end
  end
end
