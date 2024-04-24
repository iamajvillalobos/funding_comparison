namespace :fetch_initial_rates do
  desc "fetch initial funding rates for each exchange for all instruments"
  task run: :environment do
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
