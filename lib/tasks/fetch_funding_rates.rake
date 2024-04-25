namespace :fetch_funding_rates do
  desc "fetch initial funding rates for each exchange for all instruments"
  task run: :environment do
    FetchFundingRatesService.run
  end
end
