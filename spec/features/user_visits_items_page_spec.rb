RSpec.describe Item do
  describe 'Features' do
    context 'when visiting /items' do
      it 'user can create a new item' do
        merchant = Merchant.create(name: "a merchant")

        visit '/items'
        click_link('Create')
        expect(current_path).to eq('/items/new')



        save_and_open_page
        find('.merchant-select').find(:option, merchant.name).select_option
        fill_in('item[title]', with: 'puzzle')
        fill_in('item[description]', with: 'stuff')
        fill_in('item[price]', with: 2000)
        fill_in('item[image]', with: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk')
        click_on('Create Item')
        expect(current_path).to eq('/items')

        expect(page).to have_content('puzzle')
        expect(page).to have_content('$ 2000.00')
        expect(page).to have_css("img[src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk']")
      end
      it 'can click to go to items show page' do
        item = Item.create(title: 'the', description: 'thing', price: 123, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk', merchant_id: 1)
        Merchant.create(name: 'bill')

        visit '/items'

        click_link('the')

        expect(current_path).to eq("/items/#{item.id}")
      end
    end
    context 'when visiting /items/:id' do
      it 'can see specific merchants attributes' do
        item = Item.create(title: 'the', description: 'thing', price: 123, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk', merchant_id: 1)
        Merchant.create(name: 'bill')
        visit "/items/#{item.id}"

        expect(page).to have_content("#{item.title}")
        expect(page).to have_content("#{item.money}")
        expect(page).to have_css("img[src=\"#{item.image}\"]")
      end
      it 'can edit an item' do
        item = Item.create(title: 'the', description: 'thing', price: 123, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk', merchant_id: 1)
        Merchant.create(name: 'bill')

        visit "/items/#{item.id}"

        click_link("Edit")

        expect(current_path).to eq("/items/#{item.id}/edit")

        fill_in('merchant[name]', with: 'bill')
        fill_in('item[title]', with: 'title')
        fill_in('item[description]', with: 'new')
        fill_in('item[price]', with: 200)
        fill_in('item[image]', with: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk')

        click_on("Update Item")

        expect(current_path).to eq("/items/#{item.id}")

        expect(page).to have_content("title")
        expect(page).to have_content("new")
        expect(page).to have_content("$ 200.00")
        expect(page).to have_css("img[src=\"#{item.image}\"]")
      end
      it 'can delete an item' do
        item = Item.create(title: 'the', description: 'thing', price: 123, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMCV5BSXNic3ROSU9tsk4oIEqpBro_HEW-Vzbu6G9dtr6xTKkk', merchant_id: 1)
        Merchant.create(name: 'bill')

        visit "/items/#{item.id}"

        click_button("Delete")

        expect(current_path).to eq ('/items')

        expect(page).to_not have_content("#{item.title}")
        expect(page).to_not have_content("#{item.money}")
        expect(page).to_not have_css("img[src=\"#{item.image}\"]")
      end
    end
  end
end
