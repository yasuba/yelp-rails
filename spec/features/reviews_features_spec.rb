require 'rails_helper'

describe 'writing reviews' do

    before do
        Restaurant.create(name: 'The FD')
    end

    def leave_review(review, rating)
        visit '/restaurants'
        click_link 'Review The FD'
        fill_in 'Your review', with: review
        select rating, from: 'Rating'
        click_button 'Leave review'
    end

    it 'allows a user to leave a review in a form' do
        leave_review('Full ov yumz', 5)
        expect(current_path).to eq '/restaurants'
        expect(page).to have_content 'Full ov yumz'
    end

    it 'displays an average rating for all reviews' do
        leave_review('Full ov yumz', 5)
        leave_review('Whut', 3)
        expect(page).to have_content('Average rating: ★★★★☆')
    end

end