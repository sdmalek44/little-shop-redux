RSpec.describe Item do
  describe 'Validations' do
    it 'is invalid without a title' do
      item = Item.create(description: '300 piece jigsaw', price: 1000, image:'/example')

      expect(item).to_not be_valid
    end
    it 'is invalid without a description' do
      item = Item.create(title: 'puzzle', price: 1000, image:'/example')

      expect(item).to_not be_valid
    end
    it 'is invalid without a price' do
      item = Item.create(title: 'puzzle', description: '300 piece jigsaw', image:'/example')

      expect(item).to_not be_valid
    end
    it 'is invalid without an image' do
      item = Item.create(title: 'puzzle', description: '300 piece jigsaw', price: 1000)

      expect(item).to_not be_valid
    end
  end
  describe 'Class Methods' do
    it 'converts csv headers to accurate names' do
      Merchant.create(name: "Tom")
      item_params = {merchant:{name: "Tom"},
                    item:{name: "battleship",
                          unit_price: 10}
                    }
      expected_result = {merchant:{name: "Tom"},
                         item:{name: "battleship",
                               unit_price: 10,
                               merchant_id: 1,
                               price: 0}
                        }

      expect(Item.convert_params(item_params)).to eq(expected_result)
    end
    it 'finds merchant with highest priced item' do
      merchant1 = Merchant.create(name: "Bob")
      item1 = Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
      merchant2 = Merchant.create(name: "Joe")
      item2 = Item.create(merchant_id: 2, title: 'puzzle', description: '300 piece jigsaw', price: 2000, image: "google.com")

      expected_result = merchant2

      expect(Item.merchant_with_highest_item_price).to eq(expected_result)
    end
    it 'finds the average price' do

      item1 = Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
      item2 = Item.create(merchant_id: 2, title: 'puzzle', description: '300 piece jigsaw', price: 2000, image: "google.com")

      expected_result = 15.0

      expect(Item.average_price).to eq(expected_result)
    end
    it 'finds the newest item' do
      item1 = Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
      item2 = Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")

      expected_result = item2

      expect(Item.newest).to eq(expected_result)
    end
    it 'finds the oldest item' do
      item1 = Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")
      item2 = Item.create(merchant_id: 2, title: 'chess', description: '300 piece jigsaw', price: 2000, image: "google.com")

      expected_result = item1

      expect(Item.oldest).to eq(expected_result)
    end
  end
  describe 'Instance Methods' do
    it 'converts pennies into dollar amount' do
      item = Item.create(merchant_id: 1, title: 'puzzle', description: '300 piece jigsaw', price: 1000, image: "google.com")

      expected_result = 10.0
      expect(item.money).to eq(expected_result)
    end
  end
end
