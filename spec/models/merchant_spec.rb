RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.new()

      expect(merchant).to_not be_valid
    end
  end
  describe 'When user is' do
    context 'Visiting /merchants' do
      it 'can create, edit and delete a new merchant' do
        visit '/merchants'

        click_link('Create a new Merchant')
        expect(current_path).to eq('/merchants/new')

        fill_in('merchant[name]', with: 'example Merchant name')
        click_on('Submit')
        expect(current_path).to eq('/merchants')

        within('.merchant-name') do
          expect(page).to have_content('name: example Merchant name')
        end
        visit '/merchants'

        click_on('edit')
        expect(current_path).to eq('/merchants/1/edit')

        fill_in('merchant[name]', with: 'a different merchant name')
        click_on('Edit')
        expect(current_path).to eq('/merchants')
        within('.merchant-name') do
          expect(page).to have_content('name: a different merchant name')
        end
      end

    end
  end
end
