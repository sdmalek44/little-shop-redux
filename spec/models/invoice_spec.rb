RSpec.describe Invoice do
  describe 'Validations' do
    it 'is invalid without a merchant id' do
      invoice = Invoice.new(status: 'complete')

      expect(invoice).to_not be_valid
    end
    it 'is invalid without a status' do
      invoice = Invoice.new(merchant_id: 5)

      expect(invoice).to_not be_valid
    end
  end
end
