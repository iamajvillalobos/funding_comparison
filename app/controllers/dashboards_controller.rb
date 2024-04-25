class DashboardsController < ApplicationController
  def show
    @instruments = if params[:coin]
      Instrument.where(name: params[:coin])
    else
      Instrument.order(name: :asc)
    end
    @aevo = Exchange.find_by(name: "Aevo")
    @hyperliquid = Exchange.find_by(name: "Hyperliquid")
    @latest_funding_rate = FundingRate.order(created_at: :desc)&.first
  end
end