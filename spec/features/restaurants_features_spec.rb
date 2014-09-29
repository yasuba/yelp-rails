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

describe 'creating restaurants' do

    it 'prompts user to fill in form and then displays restaurant' do
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'Galvin la Chapelle'
    fill_in 'Description', with: "It's da shizzle yo"
    click_button 'Submit restaurant'
    expect(page).to have_content('Galvin la Chapelle')
    expect(current_path).to eq '/restaurants'
    end

end
