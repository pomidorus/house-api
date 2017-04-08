class HousePriceIndex < ApplicationRecord
  validates_presence_of :date, :region_name, :index

  def self.uniq_regions
    distinct.pluck(:region_name)
  end
end
