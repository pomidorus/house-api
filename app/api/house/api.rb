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
      hpi = HousePriceIndex.create!(date: params[:date], region_name: params[:region_name], index: params[:index])
      hpi.update_attributes(year: hpi.date.year, month: Date::MONTHNAMES[hpi.date.month])
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

    desc 'Years available from the region'
    params do
      requires :name, type: String, desc: 'Name of the region'
    end
    get '/region' do
      { years: HousePriceIndex.region_uniq_years(params[:name]) }
    end

    desc 'Months and indexes available from the year'
    params do
      requires :region_name, type: String, desc: 'Name of the region'
      requires :number, type: Integer, desc: 'Number of the year'
    end
    get '/region/year' do
      { data: HousePriceIndex.region_year_data(params[:region_name], params[:number]) }
    end
  end
end
