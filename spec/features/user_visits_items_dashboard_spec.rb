RSpec.describe Item do
  describe 'Features' do
    context 'when visiting /items-dashboard' do
      it 'sees title' do

        Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
        Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")

        visit '/items-dashboard'

        expect(page).to have_content("Items Dashboard")
      end
      it 'sees total item count' do

        Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
        Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")

        visit '/items-dashboard'

        expect(page).to have_content("Total Item Count", "2")
      end
      it 'sees average price per item' do

        Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
        Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")

        visit '/items-dashboard'

        expect(page).to have_content("Avg Price Per Item", "15.0")
      end
      it 'sees newest item' do

        Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
        Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")

        visit '/items-dashboard'

        expect(page).to have_content("Item by Age", "Newest Item: chess")
      end
      it 'sees oldest item' do

        Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
        Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")

        visit '/items-dashboard'

        expect(page).to have_content("Item by Age", "Oldest Item: puzzle")
      end
      it 'can click to go to newest item show page' do

        item1 = Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
        item2 = Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")
        Merchant.create(name: 'bill')
        Merchant.create(name: 'bob')
        
        visit '/items-dashboard'

        click_link('chess')

        expect(current_path).to eq("/items/#{item2.id}")
      end
      it 'can click to go to oldest item show page' do

        item1 = Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
        item2 = Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")
        Merchant.create(name: 'bill')
        Merchant.create(name: 'bob')

        visit '/items-dashboard'

        click_link('puzzle')

        expect(current_path).to eq("/items/#{item1.id}")
      end
    end
  end
end
