require 'rails_helper'

describe 'restaurants' do

    context 'restaurants have not been added' do

        it 'should display at prompt to add restaurants' do
            visit '/restaurants'
            expect(page).to have_content 'No restaurants yet'
            expect(page).to have_link 'Add a restaurant'
        end

    end

    context 'restaurants have been added' do

        before do
            Restaurant.create(name: 'Nobu')
        end

        it 'should display restaurants' do
            visit '/restaurants'
            expect(page).to have_content('Nobu')
            expect(page).not_to have_content('No restaurants yet')
        end

    end

end