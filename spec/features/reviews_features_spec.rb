require 'rails_helper'
require_relative 'helpers/user_helper'

include SessionHelpers

describe 'writing reviews' do

  before do
    Restaurant.create(name: 'The FD')
  end

  def leave_review(review, rating)
    visit '/'
    click_link 'The FD'
    # click_link 'Review The FD'
    fill_in 'Your review', with: review
    select rating, from: 'Rating'
    click_button 'Leave review'
  end

  it 'allows a user to leave a review in a form' do
    sign_up('m@test.com', '1234567890', '1234567890')
    leave_review('Full ov yumz', 5)
    expect(current_path).to match /restaurants\/\d/
    expect(page).to have_content 'Full ov yumz'
    expect(page).to have_content 'm@test.com'
  end

  it 'displays an average rating for all reviews' do
    sign_up('o@test.com', '1234567890', '1234567890')
    leave_review('Full ov yumz', 5)
    leave_review('Whut', 3)
    click_link 'Return to restaurants'
    expect(page).to have_content('Average rating: ★★★★☆')
  end

  it 'only sign-in users may leave reviews' do
    leave_review('Gosh, that was tasty', 4)
    expect(current_path).to eq '/users/sign_in'
  end

end