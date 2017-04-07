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
      HousePriceIndex.create!(date: params[:date], region_name: params[:region_name], index: params[:index])
    end
  end
end
