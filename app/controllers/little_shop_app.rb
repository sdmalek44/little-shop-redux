class LittleShopApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :home
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
    redirect "/merchants/#{id}"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  delete '/merchants/:id' do
    Merchant.delete(params[:id])
    redirect '/merchants'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/show'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/edit'
  end

  patch '/invoices/:id' do |id|
    invoice_params = Invoice.convert_params(params)
    Invoice.update(id.to_i, invoice_params[:invoice])
    redirect '/invoices'
  end

  delete '/invoices/:id' do
    Invoice.delete(params[:id])
    redirect '/invoices'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    erb :'items/new'
  end

  post '/items' do
    new_params = Item.convert_params(params)
    Item.create(new_params[:item])
    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'items/show'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  patch '/items/:id' do |id|
    new_params = Item.convert_params(params)
    Item.update(id.to_i, new_params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/:id' do
    Item.delete(params[:id])
    redirect '/items'
  end
end
