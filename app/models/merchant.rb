class Merchant < ActiveRecord::Base
  has_many :items
  validates_presence_of :name

  def item_count
    items.length
  end

  def avg_item_price
    (items.average(:price).to_f / 100.0).round(2)
  end

  def items_total_cost
    (items.sum(:price).to_f / 100.0).round(2)
  end

  def self.most_items
    all.max_by { |merchant| merchant.item_count }
  end
end
