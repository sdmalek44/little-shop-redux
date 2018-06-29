class Item < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image

  def money
    (price / 100.0).round(2)
  end

  def self.convert_params(item_params)
    item_params[:item][:price] = (item_params[:item][:price].to_f * 100).to_i
    item_params
  end
end
