RSpec.describe Merchant do
  describe 'Features' do
    describe 'when you visit the merchant dashboard' do
      it 'test you can see title' do
        visit '/merchants-dashboard'

        expect(page).to have_content("Merchants Dashboard")
      end
      it 'test you can see the merchant with the most items' do
        merchant_1 = Merchant.create(name: 'Steve')
        merchant_2 = Merchant.create(name: 'Bob')

        Item.create(merchant_id: merchant_1.id, title: "puzzle", description: "blah", price: 1000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_1.id, title: "basketball", description: "foo", price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_2.id, title: "thing", description: "foo", price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit '/merchants-dashboard'

        expect(page).to have_content("Merchant With Most Items:", "#{merchant_1.name}")
      end
      it 'test you can see the merchant with the hightest price item' do
        merchant_1 = Merchant.create(name: 'Steve')
        merchant_2 = Merchant.create(name: 'Bob')

        Item.create(merchant_id: merchant_1.id, title: "puzzle", description: "blah", price: 1000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_2.id, title: "basketball", description: "foo", price: 400, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_2.id, title: "thing", description: "foo", price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit '/merchants-dashboard'

        expect(page).to have_content("Merchant With Highest Item Price:", "#{merchant_1.name}")
      end
      it 'you can see all merchant names and item count' do
        merchant_1 = Merchant.create(name: 'Steve')
        merchant_2 = Merchant.create(name: 'Bob')

        Item.create(merchant_id: merchant_1.id, title: "puzzle", description: "blah", price: 1000, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_1.id, title: "basketball", description: "foo", price: 500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_2.id, title: "thing", description: "foo", price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit '/merchants-dashboard'

        within(".each-objects") do
          expect(page).to have_content("#{merchant_2.name}", "#{merchant_1.name}")
          expect(page).to have_content("Item Count:", "2")
          expect(page).to have_content("Item Count:", "1")
        end
      end
      it 'you can see average item price of merchant' do
        merchant_1 = Merchant.create(name: 'Steve')

        Item.create(merchant_id: merchant_1.id, title: "puzzle", description: "blah", price: 500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_1.id, title: "basketball", description: "foo", price: 500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_1.id, title: "thing", description: "foo", price: 500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit '/merchants-dashboard'

        expect(page).to have_content("Average Item Price:", "$5.0")
      end
      it 'you can see the total cost of items for merchant' do
        merchant_1 = Merchant.create(name: 'Steve')

        Item.create(merchant_id: merchant_1.id, title: "puzzle", description: "blah", price: 500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_1.id, title: "basketball", description: "foo", price: 500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")
        Item.create(merchant_id: merchant_1.id, title: "thing", description: "foo", price: 500, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk")

        visit '/merchants-dashboard'

        expect(page).to have_content("Total Cost Of Items:", "$15.0")
      end
    end
  end
end
