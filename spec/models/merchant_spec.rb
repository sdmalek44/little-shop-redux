RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.new()

      expect(merchant).to_not be_valid
    end
  end
  describe 'Instance methods' do
    it 'can count items for a merchant' do
      merchant = Merchant.create(name: 'bob')
      Item.create(merchant_id: 1, title: 'thing1', description: 'stuff1', price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")
      Item.create(merchant_id: 1, title: 'thing2', description: 'stuff2', price: 200, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")

      expect(merchant.item_count).to eq(2)
    end
    it 'can find average item price for merchant' do
      merchant = Merchant.create(name: 'bob')
      Item.create(merchant_id: 1, title: 'thing1', description: 'stuff1', price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")
      Item.create(merchant_id: 1, title: 'thing2', description: 'stuff2', price: 200, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")

      expect(merchant.avg_item_price).to eq(1.5)
    end
    it 'can find the total cost of all a merchants items' do

      merchant = Merchant.create(name: 'bob')
      Item.create(merchant_id: 1, title: 'thing1', description: 'stuff1', price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")
      Item.create(merchant_id: 1, title: 'thing2', description: 'stuff2', price: 200, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")

      expect(merchant.items_total_cost).to eq(3.0)
    end
  end
  describe 'Class Methods' do
    it 'can find the merchant with the most items' do
      merchant_1 = Merchant.create(name: 'bob')
      merchant_2 = Merchant.create(name: 'bob')
      Item.create(merchant_id: 1, title: 'thing1', description: 'stuff1', price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")
      Item.create(merchant_id: 1, title: 'thing2', description: 'stuff2', price: 200, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")
      Item.create(merchant_id: 2, title: 'thing1', description: 'stuff1', price: 100, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLgC2ECz9dKjjl7rwERXLHcMk9xEwdByuQWTb3OgehO-ithKd")

      expect(Merchant.most_items).to eq(merchant_1)
    end
  end
end
