class Invoice < ActiveRecord::Base
  has_many :invoice_items
  belongs_to :merchant
  validates_presence_of :merchant_id, :status, :customer_id

  def merchant_name
    merchant.name if merchant
  end

  def self.convert_params(invoice_params)
    invoice_params[:invoice][:merchant_id] = Merchant.find_or_create_by(name: invoice_params[:merchant][:name]).id
    invoice_params
  end

  def total_price
    invoice_items.inject(0) do |sum, invoice_item|
      sum += invoice_item.total_price
    end
  end

  def total_quantity
    invoice_items.inject(0) do |sum, invoice_item|
      sum += invoice_item.quantity
    end
  end
end
