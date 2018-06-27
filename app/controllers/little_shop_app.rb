class LittleShopApp < Sinatra::Base
  get '/' do
    erb :merchants
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :merchants
  end

  get '/merchants/new' do
    erb :new
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :merchant
  end

  delete '/merchants/:id' do
    Merchant.delete(params[:id])
    redirect '/merchants'
  end
end
