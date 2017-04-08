class HousePriceIndex < ApplicationRecord
  validates_presence_of :date, :region_name, :index

  def self.uniq_regions
    distinct.pluck(:region_name)
  end

  def self.region_uniq_years(name)
    where(region_name: name).distinct.pluck(:year)
  end
end
