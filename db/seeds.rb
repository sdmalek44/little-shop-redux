require 'csv'
require './app/models/merchant.rb'
require './app/models/invoice.rb'
require './app/models/item.rb'

def create_seeds(file_path, model)
  opened = CSV.open file_path, headers: true, header_converters: :symbol
  seeds = opened.inject(0) do |num, row|
    row_hash = row.to_h
    row_hash = convert_items(row_hash) if model == Item
    model.create!(row_hash)
    num += 1
  end
  "#{seeds} seeds created"
end

def convert_items(row_hash)
  row_hash[:title] = row_hash[:name]
  row_hash[:price] = row_hash[:unit_price]
  row_hash[:image] = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk"
  row_hash = row_hash.except!(:name, :unit_price)
end

puts create_seeds('./data/merchants.csv', Merchant)
puts create_seeds('./data/invoices.csv', Invoice)
puts create_seeds('./data/items.csv', Item)
