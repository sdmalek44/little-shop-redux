class Item < ActiveRecord::Base
  belongs_to :merchant
  validates_presence_of :title, :description, :price, :image

  def money
    (price / 100.0).round(2)
  end

  def self.convert_params(item_params)
    item_params[:item][:price] = (item_params[:item][:price].to_f * 100).to_i
    item_params[:item][:merchant_id] = Merchant.find_or_create_by(name: item_params[:merchant][:name]).id
    item_params
  end

  def self.merchant_with_highest_item_price
    all.order(:price).last.merchant
  end

  def self.average_price
    (average(:price).to_f / 100.0).round(2)
  end

  def self.newest
    maximum(:created_at)
  end

  def self.oldest
    minimum(:created_at)
  end
end
