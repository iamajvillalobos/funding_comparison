class DashboardsController < ApplicationController
  def show
    @instruments = Instrument.order(name: :asc)
  end
end