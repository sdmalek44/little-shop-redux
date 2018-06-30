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
end
