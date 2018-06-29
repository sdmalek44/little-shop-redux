class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    redirect '/merchants'
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  patch '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  delete '/merchants/:id' do
    Merchant.delete(params[:id])
    redirect '/merchants'
  end

  get '/items' do
    @item = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    erb ':items/new'
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end
end
