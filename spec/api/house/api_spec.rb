require 'rails_helper'

describe House::API, type: :request do
  let(:date) { '2005-09-01' }
  let(:region_name) { 'Aberdeenshire' }
  let(:index) { 58.35313548 }

  describe 'GET /regions' do
    
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
