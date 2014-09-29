require 'rails_helper'

describe 'restaurants' do

    context 'restaurants have not been added' do

        it 'should display at prompt to add restaurants' do
            visit '/restaurants'
            expect(page).to have_content 'No restaurants yet'
            expect(page).to have_link 'Add a restaurant'
        end

    end

end