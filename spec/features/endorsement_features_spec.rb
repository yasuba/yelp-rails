require 'rails_helper'

describe 'endorsing reviews' do

    before do
        pizza_hut = Restaurant.create(name: 'Pizza Hut')
        pizza_hut.reviews.create(rating: 3, review: 'Ok')
    end

    it 'can endorse a review updating the review endorsement count' do
        visit '/restaurants'
        click_link 'Endorse this review'
        expect(page).to have_content '1 endorsement'
    end


end