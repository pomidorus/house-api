require 'rails_helper'

RSpec.describe HousePriceIndex, type: :model do
  let(:date) { '2005-09-01' }
  let(:region_name) { 'Aberdeenshire' }
  let(:region_name_2) { 'London' }
  let(:index) { 58.35313548 }

  before do
    @hpi = HousePriceIndex.create!(date: date, region_name: region_name, index: index)
  end

  it 'contains valid attributes' do
    expect(@hpi).to have_attributes(region_name: region_name)
  end

  describe '#uniq_regions' do
    let!(:hpi_1) { HousePriceIndex.create(date: date, region_name: region_name, index: index) }
    let!(:hpi_2) { HousePriceIndex.create(date: date, region_name: region_name, index: index) }
    let!(:hpi_3) { HousePriceIndex.create(date: date, region_name: region_name_2, index: index) }

    it 'returns uniq regions names' do
      expect(HousePriceIndex.uniq_regions.count).to eq(2)
    end
  end
end
