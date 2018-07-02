class Invoice < ActiveRecord::Base
  has_many :invoice_items
  belongs_to :merchant
  belongs_to :customer
  validates_presence_of :merchant_id, :status, :customer_id

  def self.status(status)
    where(status: status).count
  end

  def self.invoice_quantity(direction)
    select("invoices.*, SUM(invoice_items.quantity) AS total_quantity")
    .joins(:invoice_items)
    .group(:invoice_id, :id)
    .order("total_quantity #{direction}")
    .limit(1)
  end

  def self.invoice_price(direction)
    select("invoices.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS total_price")
    .joins(:invoice_items)
    .group(:invoice_id, :id)
    .order("total_price #{direction}")
    .limit(1)
  end

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
    # invoice_items.inject(0) do |sum, invoice_item|
    #   sum += invoice_item.quantity
    # end
    invoice_items.sum("quantity")
  end

end
