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

describe 'editing restaurants' do

    before do
        Restaurant.create(name: 'The FD', description: 'Food wizardry')
    end

    it 'allows a user to edit a restaurant' do
        visit '/restaurants'
        click_link 'Edit The FD'
        fill_in 'Name', with: 'The Fat Duck'
        click_button 'Submit restaurant'
        expect(page).to have_content 'The Fat Duck'
        expect(current_path).to eq '/restaurants'
    end

    it 'shows the description' do
        visit '/restaurants'
        click_link 'The FD'
        expect(page).to have_content 'Food wizardry'
        expect(current_path).to match /restaurants\/\d/
        click_link 'Return to restaurants'
        expect(current_path).to eq '/restaurants'
    end

end

describe 'deleting a restaurant' do

    before do
        Restaurant.create(name: 'The FD', description: 'Food wizardry')
    end

    it 'deletes a restaurant when a user clicks the delete button' do
        visit '/restaurants'
        click_link 'Delete The FD'
        expect(page).to_not have_content 'The FD'
        expect(page).to have_content 'Restaurant deleted'
    end

end
