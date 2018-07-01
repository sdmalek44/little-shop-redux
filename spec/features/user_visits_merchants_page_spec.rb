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

        expect(page).to have_content('example Merchant name')
      end
      it 'user can edit a merchant' do
        merchant = Merchant.create(name: 'bob')

        visit '/merchants'

        click_on('edit')
        expect(current_path).to eq("/merchants/#{merchant.id}/edit")

        fill_in('merchant[name]', with: 'a different merchant name')
        click_on('Edit')
        expect(current_path).to eq("/merchants/#{merchant.id}")

        expect(page).to have_content('a different merchant name')
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
    context 'when visiting /merchants/:id' do
      it 'will see a list of items for merchant' do
        merchant = Merchant.create(name: 'Seth')
        item1 = Item.create(merchant_id: merchant.id, title: "puzzle", description: "blah", price: 1000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        item2 = Item.create(merchant_id: merchant.id, title: "basketball", description: "foo", price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit "/merchants/#{merchant.id}"

        expect(page).to have_content("#{item1.title}", "$10.0")
        expect(page).to have_content("#{item2.title}", "$1.0")
      end
    end
  end
end
