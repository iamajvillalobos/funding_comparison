class DashboardsController < ApplicationController
  def show
    @instruments = Instrument.order(name: :asc)
    @aevo = Exchange.find_by(name: "Aevo")
    @hyperliquid = Exchange.find_by(name: "Hyperliquid")
    @latest_funding_rate = FundingRate.order(created_at: :desc)&.first
  end
end