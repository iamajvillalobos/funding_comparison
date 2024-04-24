class FundingRate < ApplicationRecord
  belongs_to :exchange
  belongs_to :instrument
end
