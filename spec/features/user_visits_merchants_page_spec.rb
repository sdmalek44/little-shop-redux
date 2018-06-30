RSpec.describe Merchant do
  describe 'Features' do
    context 'when visiting /merchants' do
      it 'user can create a new merchant' do
        visit '/merchants'

        click_link('Create a new Merchant')
        expect(current_path).to eq('/merchants/new')

        fill_in('merchant[name]', with: 'example Merchant name')
        click_on('Submit')
        expect(current_path).to eq('/merchants')

        within('#name-1') do
          expect(page).to have_content('example Merchant name')
        end
      end
      it 'user can edit a merchant' do
        merchant = Merchant.create(name: 'bob')

        visit '/merchants'

        click_on('edit')
        expect(current_path).to eq("/merchants/#{merchant.id}/edit")

        fill_in('merchant[name]', with: 'a different merchant name')
        click_on('Edit')
        expect(current_path).to eq('/merchants')

        within('#name-1') do
          expect(page).to have_content('a different merchant name')
        end
      end
      it 'user can delete a merchant' do
        merchant1 = Merchant.create(name: 'Steve')
        merchant2 = Merchant.create(name: 'Seth')
        merchant3 = Merchant.create(name: 'Andrew')

        visit '/merchants'

        within('#delete-3') do
          click_button('delete')
        end

        expect(page).not_to have_content('name: Andrew')
      end
    end
  end
end
