class CreateExchanges < ActiveRecord::Migration[7.1]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.string :api_endpoint

      t.timestamps
    end
  end
end
