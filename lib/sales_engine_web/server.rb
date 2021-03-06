module SalesEngineWeb
  class Server < Sinatra::Base
    get '/merchants/find' do
      status 200
      if params[:id]
        merchant = Merchant.find(params[:id])
      else
        merchant = Merchant.find_by_name(params[:name])
      end
      body merchant.to_json
    end

    get '/merchants/random' do
      Merchant.random.to_json
    end
  end
end