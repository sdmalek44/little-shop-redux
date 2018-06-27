RSpec.describe Merchant do
  describe 'Validations' do
    it 'is invalid without a name' do
      merchant = Merchant.new(id: 666, created_at: Date.new, updated_at: Date.new)

      expect(merchant).to_not be_valid
    end
    it 'is invalid without a merchant id' do
      merchant = Merchant.new(name: 'bob', created_at: Date.new, updated_at: Date.new)

      expect(merchant).to_not be_valid
    end
    it 'is invalid without created at timestamp' do
      merchant = Merchant.new(name: 'todd', updated_at: Date.new, id: 4)

      expect(merchant).to_not be_valid
    end
    it 'is invalid without updated at timestamp' do
      merchant = Merchant.new(name: 'todd', created_at: Date.new, id: 4)

      expect(merchant).to_not be_valid
    end
    it 'is valid if all four attributes included' do
      merchant = Merchant.new(name: 'todd', created_at: Date.new, updated_at: Date.new, id: 4)

      expect(merchant).to be_valid
    end
  end
end
