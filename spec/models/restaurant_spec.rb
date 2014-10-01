require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
    it 'is not valid with a name of fewer than 3 characters' do
        restaurant = Restaurant.new(name: 'Ga')
        expect(restaurant).to have(1).error_on(:name)
        expect(restaurant).not_to be_valid
    end

    it "can only create a restaurant if it has a unique name" do
        Restaurant.create(name: 'Nobu')
        restaurant = Restaurant.new(name: 'Nobu')
        expect(restaurant).to have(1).error_on(:name)
    end
    
end

describe '#average_rating' do

    context 'no reviews' do

        it 'returns N/A' do
            restaurant = Restaurant.create(name: 'The FD')
            expect(restaurant.average_rating).to eq 'N/A'
        end

    end

    context '1 review' do

        it 'returns that rating' do
            restaurant = Restaurant.create(name: 'The FD')
            restaurant.reviews.create(rating: 4)
            expect(restaurant.average_rating).to eq 4
        end

    end

    context 'multiple reviews' do

        it 'returns the average score' do
            restaurant = Restaurant.create(name: 'The FD')
            restaurant.reviews.create(rating: 3)
            restaurant.reviews.create(rating: 5)
            expect(restaurant.average_rating).to eq 4
        end
    
    end

end
