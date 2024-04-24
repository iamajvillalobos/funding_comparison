class AddInstrumentIdToFundingRates < ActiveRecord::Migration[7.1]
  def change
    add_reference :funding_rates, :instrument, null: false, foreign_key: true
  end
end
