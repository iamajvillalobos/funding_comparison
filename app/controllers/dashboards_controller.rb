class DashboardsController < ApplicationController
  def show
    @instruments = Instrument.order(name: :asc)
    @aevo = Exchange.find_by(name: "Aevo")
    @hyperliquid = Exchange.find_by(name: "Hyperliquid")
  end
end