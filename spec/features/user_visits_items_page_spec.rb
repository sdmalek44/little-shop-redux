RSpec.describe Item do
  describe 'Features' do
    context 'when visiting /items' do
      it 'user can create a new item' do
        visit '/items'

        click_link('Create')
        expect(current_path).to eq('/items/new')

        fill_in('item[title]', with: 'puzzle')
        fill_in('item[description]', with: 'stuff')
        fill_in('item[price]', with: 2000)
        fill_in('item[image]', with: '/blah/blah')
        click_on('Create Item')
        expect(current_path).to eq('/items')

        expect(page).to have_content('puzzle')
      end
    end
  end
end
