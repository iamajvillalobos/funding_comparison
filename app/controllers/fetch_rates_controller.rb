class FetchRatesController < ApplicationController
  def create
    Instrument.all.each do |instrument|
      Exchange.all.each do |exchange|
        FetchFundingRateJob.perform_later(
          exchange: exchange,
          instrument: instrument
        )
      end
    end

    redirect_to root_path
  end
end