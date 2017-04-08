module House
  class API < Grape::API
    format :json
    helpers do
      def region
        @region ||= HousePriceIndex.where(region_name: params[:name])
      end
    end

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

    desc 'List of all HPI in the DB'
    get '/hpi' do
      HousePriceIndex.all.to_json
    end

    desc 'House price indexes total count'
    get '/hpi/count' do
      { hpi_count: HousePriceIndex.count }
    end

    desc 'List of unique regions'
    get '/regions' do
      { regions: HousePriceIndex.uniq_regions }
    end

    desc 'Dates and indexes from region'
    params do
      requires :name, type: String, desc: 'Name of the region'
    end
    get '/region' do
      { years: region }
    end
  end
end
