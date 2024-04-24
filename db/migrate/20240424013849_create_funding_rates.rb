class CreateFundingRates < ActiveRecord::Migration[7.1]
  def change
    create_table :funding_rates do |t|
      t.references :exchange, null: false, foreign_key: true
      t.decimal :rate
      t.datetime :expire_at

      t.timestamps
    end
  end
end
