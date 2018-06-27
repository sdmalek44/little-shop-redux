class LittleShopApp < Sinatra::Base
  get '/' do
    erb :merchants
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :merchants
  end
end
