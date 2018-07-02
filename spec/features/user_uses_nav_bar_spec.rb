describe 'features' do
  context 'when visiting any page nav bar' do
    it 'can go to the main page' do
      visit '/merchants'

      click_link('Little Shop')
      expect(current_path).to eq('/')
    end
    it 'can go to the /merchants page' do
      visit '/items'

      click_link('Merchants')
      expect(current_path).to eq('/merchants')
    end
    it 'can go to the /items page' do
      visit '/invoices'

      click_link('Items')
      expect(current_path).to eq('/items')
    end
    it 'can go to the /invoices page' do
      visit '/merchants'

      click_link('Invoices')
      expect(current_path).to eq('/invoices')
    end
  end
end
