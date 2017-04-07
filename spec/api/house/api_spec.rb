require 'rails_helper'

describe House::API, type: :request do
  describe 'POST /hpi' do
    let(:date) { '2005-09-01' }
    let(:region_name) { 'Aberdeenshire' }
    let(:index) { 58.35313548 }

    it '' do
      post '/hpi', params: { date: date, region_name: region_name, index: index }

      expect(response.status).to eq(201)
    end
  end
end
