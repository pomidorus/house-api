class HousePriceIndex < ApplicationRecord
  validates_presence_of :date, :region_name, :index

  def self.uniq_regions
    distinct.pluck(:region_name)
  end

  def self.region_uniq_years(region)
    where(region_name: region).distinct.pluck(:year).sort
  end

  def self.region_year_data(region, year)
    where('region_name = ? AND year = ?', region, year).pluck(:month, :index)
  end
end
