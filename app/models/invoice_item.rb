class InvoiceItem < ActiveRecord::Base
  belongs_to :item

  def item_title
    item.title
  end

  def money
    (unit_price / 100.0).round(2)
  end

  def total_price
    (unit_price + quantity) / 100.0
  end
end
