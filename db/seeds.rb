require 'csv'
require './app/models/merchant.rb'

def create_seeds(file_path, model)
  opened = CSV.open file_path, headers: true, header_converters: :symbol
  seeds = opened.inject(0) do |num, row|
    model.create!(row.to_h)
    num += 1
  end
  "#{seeds} seeds created"
end

puts create_seeds('./data/merchants.csv', Merchant)
puts create_seeds('./data/invoices.csv', Invoice)
