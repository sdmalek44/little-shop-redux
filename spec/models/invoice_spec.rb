RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without a merchant id' do
      invoice = Invoice.new(status: 'complete')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a status' do
      invoice = Invoice.new(merchant_id: 5)

      expect(invoice).to_not be_valid
    end
  end
  describe 'Features' do
    context 'when visiting /invoices' do
      it 'user can view invoices' do
        invoice = Invoice.create(merchant_id: 5, status: 'pending')

        visit '/invoices'
        expect(page).to have_content('1')
      end
      it 'user can edit an invoice' do
        invoice = Invoice.create(merchant_id: 5, status: 'pending')

        visit '/invoices'
        click_on('edit')
        expect(current_path).to eq("/invoices/#{invoice.id}/edit")

        fill_in('invoice[status]', with: 'complete')
        click_on('Edit')
        expect(current_path).to eq('/invoices')
        expect(page).to have_content('Status: complete')
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
        within("#delete-#{invoice_2.id}") do
          click_on('delete')
        end

        expect(page).not_to have_content('status: complete')
      end
      it 'user can delete an invoice from show page' do
        invoice_1 = Invoice.create(merchant_id: 5, status: 'pending')
        invoice_2 = Invoice.create(merchant_id: 2, status: 'complete')

        visit '/invoices'
        click_on(invoice_1.id)
        expect(current_path).to eq("/invoices/#{invoice_1.id}")
        click_on('delete')
        expect(current_path).to eq('/invoices')
        expect(page).not_to have_content('1')
      end
    end
  end
end
