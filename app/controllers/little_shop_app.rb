require 'will_paginate/view_helpers/sinatra'
require 'will_paginate/active_record'

class LittleShopApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers
  set :method_override, true

  get '/' do
    erb :home
  end

  get '/merchants' do
    @merchants = Merchant.paginate(:page => params[:page], :per_page => 30)
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

  get '/merchants-dashboard' do
    if Merchant.count > 0
      @merchants = Merchant.all.includes(:items)
      @most_items = @merchants.most_items
      @highest_price = Item.merchant_with_highest_item_price
    end
    erb :'merchants/merchants-dashboard'
  end

  get '/invoices' do
    @invoices = Invoice.paginate(:page => params[:page], :per_page => 30)
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
    redirect "/invoices/#{id}"
  end

  delete '/invoices/:id' do
    Invoice.delete(params[:id])
    redirect '/invoices'
  end

  get '/invoices-dashboard' do
    @pending_percent = Invoice.status_percent("pending")
    @shipped_percent = Invoice.status_percent("shipped")
    @returned_percent = Invoice.status_percent("returned")

    @max_quantity = Invoice.invoice_quantity("DESC").first
    @min_quantity = Invoice.invoice_quantity("ASC").first

    @max_invoice = Invoice.invoice_price("DESC").first
    @min_invoice = Invoice.invoice_price("ASC").first

    erb :'invoices/invoice-dashboard'
  end

  get '/items' do
    @items = Item.paginate(:page => params[:page], :per_page => 20)
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
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

  get '/items-dashboard' do
    @items = Item.all
    @items_count = @items.length
    @newest = @items.newest
    @oldest = @items.oldest
    erb :'items/dashboard'
  end
end
