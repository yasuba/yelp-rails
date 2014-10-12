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

    context 'a valid restaurant' do

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

    context 'an invalid restaurant' do

        it "does not let you submit with a name that's too short" do
            visit '/restaurants/new'
            fill_in 'Name', with: 'Ga'
            click_button 'Submit restaurant'
            expect(page).not_to have_css 'h2', text: 'Ga'
            expect(page).to have_content 'The restaurant name is too short'
        end

        it "does not let you submit a restaurant unless it has a unique name" do
            Restaurant.create(name: 'Nobu')
            visit '/restaurants/new'
            fill_in 'Name', with: 'Nobu'
            click_button 'Submit restaurant'
            expect(page).to have_content 'Restaurants must have a unique name'
        end

    end

    # context 'adding an image' do

    #     it 'can have a thumbnail image file attached on the restaurant index page' do
    #         visit '/restaurants/new'
    #         fill_in 'Name', with: 'Nobu'
    #         attach_file('Image', 'spec/features/nobu.jpg')
    #         click_button('Submit restaurant')
    #         expect(page).to have_css 'img'
    #     end

    #     before do
    #         Restaurant.create(name: 'KFC', description: 'Chickeny goodness')
    #     end

    #     it 'can have a medium image attached on the show restaurant page' do
    #         visit '/restaurants'
    #         click_link 'KFC'
    #         expect(page).to have_css 'img'
    #     end

    # end

end

describe 'editing restaurants' do

    before do
        Restaurant.create(name: 'The FD', description: 'Food wizardry')
    end

    it 'allows a user to edit a restaurant' do
        visit '/restaurants'
        click_link 'Edit The FD'
        fill_in 'Name', with: 'The Fat Duck'
        fill_in 'Description', with: 'Food wizardry'
        click_button 'Submit restaurant'
        expect(page).to have_content 'The Fat Duck'
        expect(current_path).to eq '/restaurants'
    end

    it 'shows the description' do
        visit '/restaurants'
        expect(page).to have_content "Food wizardry"
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
