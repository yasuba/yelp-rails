require 'rails_helper'

RSpec.describe Review, :type=> :model do

    it 'is not valid with a rating of greater than 5' do
        review = Review.new(rating: 6)
        expect(review).to have(1).error_on(:rating)
        expect(review).not_to be_valid
    end

end