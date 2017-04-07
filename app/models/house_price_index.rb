class HousePriceIndex < ApplicationRecord
  validates_presence_of :date, :region_name, :index
end
