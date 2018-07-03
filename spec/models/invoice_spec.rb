RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without a merchant id' do
      invoice = Invoice.new(status: 'pending', customer_id: 2)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a status' do
      invoice = Invoice.new(merchant_id: 5, customer_id: 2)

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a customer_id' do
      invoice = Invoice.new(merchant_id: 5, status: 'pending')

      expect(invoice).to_not be_valid
    end
  end
  describe 'Methods' do
    it 'can filter invoices by status' do
      invoice_1 = Invoice.create(customer_id: 5, merchant_id: 3, status: 'pending')
      invoice_2 = Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
      invoice_3 = Invoice.create(customer_id: 3, merchant_id: 3, status: 'pending')
      invoice_4 = Invoice.create(customer_id: 5, merchant_id: 2, status: 'returned')
      invoice_5 = Invoice.create(customer_id: 4, merchant_id: 2, status: 'shipped')
      invoice_6 = Invoice.create(customer_id: 5, merchant_id: 3, status: 'pending')

      actual_shipped = Invoice.status("shipped")
      actual_pending = Invoice.status("pending")
      actual_returned = Invoice.status("returned")

      expect(actual_shipped).to eq(2)
      expect(actual_pending).to eq(3)
      expect(actual_returned).to eq(1)
    end
    it 'can find highest and lowest invoices by quantity' do
      invoice_1 = Invoice.create(customer_id: 5, merchant_id: 3, status: 'pending')
      invoice_2 = Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
      invoice_item_1 = InvoiceItem.create(invoice_id: 1, quantity: 3)
      invoice_item_1 = InvoiceItem.create(invoice_id: 1, quantity: 2)
      invoice_item_1 = InvoiceItem.create(invoice_id: 2, quantity: 5)
      invoice_item_1 = InvoiceItem.create(invoice_id: 2, quantity: 3)

      actual_max_invoice = Invoice.invoice_quantity("DESC").first
      actual_min_invoice = Invoice.invoice_quantity("ASC").first

      expect(actual_max_invoice).to eq(invoice_2)
      expect(actual_min_invoice).to eq(invoice_1)
    end

    it 'can find the highest and lowest invoices by total price' do
      invoice_1 = Invoice.create(customer_id: 5, merchant_id: 3, status: 'pending')
      invoice_2 = Invoice.create(customer_id: 2, merchant_id: 2, status: 'shipped')
      invoice_item_1 = InvoiceItem.create(invoice_id: 1, quantity: 3, unit_price: 500)
      invoice_item_1 = InvoiceItem.create(invoice_id: 1, quantity: 2, unit_price: 200)
      invoice_item_1 = InvoiceItem.create(invoice_id: 2, quantity: 5, unit_price: 50)
      invoice_item_1 = InvoiceItem.create(invoice_id: 2, quantity: 3, unit_price: 10)

      actual_max_invoice = Invoice.invoice_price("DESC").first
      actual_min_invoice = Invoice.invoice_price("ASC").first

      expect(actual_max_invoice).to eq(invoice_1)
      expect(actual_min_invoice).to eq(invoice_2)
    end
  end
end
