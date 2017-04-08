class HousePriceIndex < ApplicationRecord
  validates_presence_of :date, :region_name, :index
  after_create :save_year, :save_month

  def save_year
    self.year = date.year
  end

  def save_month
    self.month = Date::MONTHNAMES[date.month]
  end

  def self.uniq_regions
    distinct.pluck(:region_name)
  end
end
