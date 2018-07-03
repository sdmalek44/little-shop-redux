RSpec.describe Merchant do
  describe 'Features' do
    context 'when visiting /merchants' do
      it 'can see a list of merchants' do
        merchant1 = Merchant.create(name: 'Steve')
        merchant2 = Merchant.create(name: 'Seth')
        merchant3 = Merchant.create(name: 'Andrew')

        visit '/merchants'

        expect(page).to have_content(merchant1.name)
        expect(page).to have_content(merchant2.name)
        expect(page).to have_content(merchant3.name)
      end
      it 'can see the title' do
        visit '/merchants'

        expect(page).to have_content('Merchants')
      end
      it 'user can create a new merchant' do
        visit '/merchants'

        click_link('Create a new Merchant')
        expect(current_path).to eq('/merchants/new')

        fill_in('merchant[name]', with: 'example Merchant name')
        click_on('Submit')
        expect(current_path).to eq('/merchants')

        expect(page).to have_content('example Merchant name')
      end
      it 'user can edit a merchant' do
        merchant = Merchant.create(name: 'bob')

        visit '/merchants'

        click_on('Edit')
        expect(current_path).to eq("/merchants/#{merchant.id}/edit")

        fill_in('merchant[name]', with: 'a different merchant name')
        click_on('Update Merchant')
        expect(current_path).to eq("/merchants/#{merchant.id}")

        expect(page).to have_content('a different merchant name')

        visit '/merchants'
        expect(page).to have_content('a different merchant name')
      end
      it 'user can delete a merchant' do
        merchant1 = Merchant.create(name: 'Steve')
        merchant2 = Merchant.create(name: 'Seth')
        merchant3 = Merchant.create(name: 'Andrew')

        visit '/merchants'

        within('#delete-3') do
          click_button('Delete')
        end

        expect(page).not_to have_content('name: Andrew')
      end
    end
  end
end
