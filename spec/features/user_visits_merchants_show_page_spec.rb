RSpec.describe Merchant do
  describe 'Features' do
    context 'when visiting /merchants/:id' do
      it 'can see the merchant name' do
        merchant = Merchant.create(name: 'Brian')

        visit "/merchants/#{merchant.id}"

        expect(page).to have_content("#{merchant.name}")
      end
      it 'will see a list of items for merchant' do
        merchant = Merchant.create(name: 'Seth')
        item1 = Item.create(merchant_id: merchant.id, title: "puzzle", description: "blah", price: 1000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        item2 = Item.create(merchant_id: merchant.id, title: "basketball", description: "foo", price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit "/merchants/#{merchant.id}"

        expect(page).to have_content("#{item1.title}", "$10.0")
        expect(page).to have_content("#{item2.title}", "$1.0")
      end
      it 'can go to edit page' do
        merchant = Merchant.create(name: 'Steve')
        Item.create(merchant_id: merchant.id, title: "puzzle", description: "blah", price: 1000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit "/merchants/#{merchant.id}"

        click_link("Edit")

        expect(current_path).to eq("/merchants/#{merchant.id}/edit")
      end
      it 'can delete an merchant' do
        merchant1 = Merchant.create(name: 'Steve')
        merchant2 = Merchant.create(name: 'John')

        visit "/merchants/#{merchant1.id}"

        click_button('Delete')

        expect(current_path).to eq('/merchants')

        expect(page).to_not have_content("#{merchant1.name}")
        expect(page).to have_content("#{merchant2.name}")
      end
      it 'can see a merchants items' do
        merchant = Merchant.create(name: 'Steve')
        item_1 = Item.create(merchant_id: merchant.id, title: "puzzle", description: "blah", price: 1000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        item_2 = Item.create(merchant_id: merchant.id, title: "thing", description: "task", price: 2000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit "/merchants/#{merchant.id}"

        expect(page).to have_content("#{item_1.title}","#{item_2.title}")
        expect(page).to have_content("#{item_1.money}","#{item_2.money}")
      end
    end
  end
end
