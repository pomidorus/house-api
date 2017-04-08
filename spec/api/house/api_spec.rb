require 'rails_helper'

describe House::API, type: :request do
  let(:date) { '2005-09-01' }
  let(:region_name) { 'Aberdeenshire' }
  let(:index) { 58.35313548 }

  describe 'GET /region' do
    let!(:hpi_1) { HousePriceIndex.create(date: '2005-09-01', region_name: region_name, index: index, year: 2005) }
    let!(:hpi_2) { HousePriceIndex.create(date: '2005-10-01', region_name: region_name, index: index, year: 2005) }
    let!(:hpi_3) { HousePriceIndex.create(date: '2006-09-01', region_name: region_name, index: index, year: 2006) }

    it 'returns uniq years for the region' do
      get '/region', params: { name: region_name }
      hash_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(hash_response['years'].count).to eq(2)
    end
  end
  
  describe 'GET /hpi/count' do
    let!(:hpi) { HousePriceIndex.create(date: date, region_name: region_name, index: index) }

    it 'returns count of hpi in the db' do
      get '/hpi/count'

      expect(response.status).to eq(200)
      expect(response.body).to eq('{"hpi_count":1}')
    end
  end

  describe 'POST /hpi' do
    it 'creates a new house price index' do
      post '/hpi', params: { date: date, region_name: region_name, index: index }

      expect(response.status).to eq(201)
      expect(HousePriceIndex.count).to eq(1)
      expect(HousePriceIndex.first.year).to eq(2005)
      expect(HousePriceIndex.first.month).to eq('September')
    end
  end
end
