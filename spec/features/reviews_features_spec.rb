require 'rails_helper'

describe 'writing reviews' do

    before do
        Restaurant.create(name: 'The FD')
    end

    it 'allows a user to leave a review in a form' do
        visit '/restaurants'
        click_link 'Review The FD'
        fill_in 'Your review', with: 'Full ov yumz'
        select '5', from: 'Rating'
        click_button 'Leave review'
        expect(current_path).to eq '/restaurants'
        click_link 'The FD'
        expect(page).to have_content 'Full ov yumz'
        expect(current_path).to match /restaurants\/\d/
    end

end