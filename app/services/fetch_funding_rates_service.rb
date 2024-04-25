class FetchFundingRatesService
  def self.run
    Instrument.all.each do |instrument|
      Exchange.all.each do |exchange|
        FetchFundingRateJob.perform_later(
          exchange: exchange,
          instrument: instrument
        )
      end
    end
  end
end