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
end
