require 'rails_helper'

describe ReviewsHelper, :type => :helper do

    context '#star-rating' do

        it 'does nothing for not a number' do
            expect(helper.star_rating('N/A')).to eq 'N/A'
        end

        it 'returns five black stars for 5' do
            expect(helper.star_rating(5)).to eq '★★★★★'
        end

        it 'returns 3 black stars and 2 white stars' do
            expect(helper.star_rating(3)).to eq '★★★☆☆'
        end

        it 'rounds to the nearest star for non-whole numbers' do
            expect(helper.star_rating(3.5)).to eq '★★★★☆'
        end

        it "works for 4" do
            expect(helper.star_rating(4)).to eq '★★★★☆'
        end

    end

end