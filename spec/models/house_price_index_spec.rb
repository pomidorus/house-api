require 'rails_helper'

RSpec.describe HousePriceIndex, type: :model do
  let(:date) { '2005-09-01' }
  let(:region_name) { 'Aberdeenshire' }
  let(:index) { 58.35313548 }

  before do
    @hpi = HousePriceIndex.create!(date: date, region_name: region_name, index: index)
  end

  it 'contains valid attributes' do
    expect(@hpi).to have_attributes(region_name: region_name)
  end
end
