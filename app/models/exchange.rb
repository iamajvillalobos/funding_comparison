class Exchange < ApplicationRecord
  has_many :funding_rates, dependent: :destroy
end
