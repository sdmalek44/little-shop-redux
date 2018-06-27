class LittleShopApp < Sinatra::Base
  set :method_override, true

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

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :edit
  end

  patch '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect '/merchants'
  end
end
