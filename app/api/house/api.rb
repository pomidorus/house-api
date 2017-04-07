module House
  class API < Grape::API
    format :json

    desc 'Creates house price index'
    params do
      requires :date, type: Date, desc: 'Date'
      requires :region_name, type: String, desc: 'Region name'
      requires :index, type: Float, desc: 'House price index value'
    end
    post '/hpi' do
      # find or create...
      HousePriceIndex.create!(date: params[:date], region_name: params[:region_name], index: params[:index])
    end

    desc 'House price indexes total count'
    get '/hpi' do
      { hpi_count: HousePriceIndex.count }
    end

    desc 'List of unique regions'
    get '/regions' do
      { regions: HousePriceIndex.uniq_regions }
    end
  end
end
