class FetchRatesController < ApplicationController
  def create
    FetchFundingRatesService.run
    redirect_to root_path
  end
end