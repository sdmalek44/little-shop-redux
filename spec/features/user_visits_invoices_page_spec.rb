RSpec.describe Invoice do
  describe 'Features' do
    context 'when visiting /invoices' do
      it 'user can view invoices' do
        invoice = Invoice.create(merchant_id: 5, status: 'pending')

        visit '/invoices'
        expect(page).to have_content('1')
      end
      it 'user can edit an invoice' do
        merchant = Merchant.create(name: 'bob')
        invoice = Invoice.create(merchant_id: 1, status: 'pending')

        visit '/invoices'
        click_on('edit')
        expect(current_path).to eq("/invoices/#{invoice.id}/edit")

        find('.invoice-status-select').find(:option, "pending").select_option
        # fill_in('invoice[status]', with: 'complete')
        fill_in('merchant[name]', with: 'bobby')
        click_on('Update Invoice')

        expect(current_path).to eq("/invoices/#{invoice.id}")

        expect(page).to have_content('Invoice: 1 - pending')
      end
      it 'user can view a single invoice' do
        invoice = Invoice.create(merchant_id: 5, status: 'pending')

        visit '/invoices'
        click_on('1')
        expect(current_path).to eq("/invoices/#{invoice.id}")
      end
      it 'user can delete an invoice from index page' do
        invoice_1 = Invoice.create(merchant_id: 5, status: 'pending')
        invoice_2 = Invoice.create(merchant_id: 2, status: 'complete')

        visit '/invoices'

        within("form#delete-#{invoice_2.id}") do
          click_on('Delete')
        end

        expect(page).not_to have_content('status: complete')
      end
      it 'user can delete an invoice from show page' do
        invoice_1 = Invoice.create(merchant_id: 5, status: 'pending')
        invoice_2 = Invoice.create(merchant_id: 2, status: 'complete')

        visit '/invoices'
        click_on(invoice_1.id)
        expect(current_path).to eq("/invoices/#{invoice_1.id}")
        click_on('Delete')
        expect(current_path).to eq('/invoices')
        expect(page).not_to have_content('1')
      end
    end
  end
end
