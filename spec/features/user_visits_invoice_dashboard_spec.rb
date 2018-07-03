RSpec.describe Invoice do
  describe 'Features' do
    context 'visitor' do
      before do
        invoice_1 = Invoice.create(merchant_id: 2, customer_id: 2, status: 'pending')
        invoice_2 = Invoice.create(merchant_id: 2, customer_id: 2, status: 'returned')

        # create items here
        item = Item.create(title: "a puzzle", description: '300 piece jigsaw', price: 1000, image:'/example')
        item = Item.create(title: "a puzzle", description: '200 piece jigsaw', price: 1000, image:'/example')
        item = Item.create(title: "a puzzle", description: '100 piece jigsaw', price: 1000, image:'/example')
        item = Item.create(title: "a puzzle", description: '400 piece jigsaw', price: 1000, image:'/example')

        invoice_1.invoice_items.create(quantity: 2, unit_price: 25, item_id: 1)
        invoice_1.invoice_items.create(quantity: 3, unit_price: 50, item_id: 2)

        invoice_2.invoice_items.create(quantity: 4, unit_price: 10, item_id: 3)
        invoice_2.invoice_items.create(quantity: 2, unit_price: 5, item_id: 4)


      end

      it 'can see the title' do

        visit '/invoices-dashboard'

        expect(page).to have_content("Invoices Dashboard")
      end

      it 'can see the percentages of invoices with each status' do

        visit '/invoices-dashboard'

        expect(page).to have_content("Pending: 50%")
        expect(page).to have_content("Returned: 50%")
        expect(page).to have_content("Shipped: 0%")
      end

      it 'can see the highest and lowest invoices by price' do

        visit '/invoices-dashboard'
        print page.html

        within("#high-invoice-price") do
          expect(page).to have_content("Invoice: 1")
        end
        within("#low-invoice-price") do
          expect(page).to have_content("Invoice: 2")
        end
      end

      it 'can see the highest and lowest invoices by quantity' do

        visit '/invoices-dashboard'

        within('#high-invoice-quantity') do
          expect(page).to have_content("Invoice: 2")
        end
        within('#low-invoice-quantity') do
          expect(page).to have_content("Invoice: 1")
        end
      end

      it 'redirects to the invoice page for the invoice with the highest price' do
        visit '/invoices-dashboard'

        within('.invoice-unit-prices') do
          click_link('Invoice: 1')
        end
        expect(current_path).to eq('/invoices/1')
      end

      it 'redirects to the invoice page for the invoice with the lowest price' do
        visit '/invoices-dashboard'

        within('.invoice-unit-prices') do
          click_link('Invoice: 2')
        end
        expect(current_path).to eq('/invoices/2')
      end

      it 'redirects to the invoice page for the invoice with the highest quantity' do
        visit '/invoices-dashboard'

        within('.invoice-quantity') do
          click_link('Invoice: 2')
        end
        expect(current_path).to eq('/invoices/2')
      end

      it 'redirects to the invoice page for the invoice with the lowest quantity' do
        visit '/invoices-dashboard'

        within('.invoice-quantity') do
          click_link('Invoice: 1')
        end
        expect(current_path).to eq('/invoices/1')
      end
    end
  end
end
