class ReviewsController < ApplicationController

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      if user_signed_in?
        review = @restaurant.reviews.create(params[:review].permit(:rating, :review))
        review.user = current_user
        review.save
        redirect_to restaurant_path(@restaurant)
      else
        redirect_to new_user_session_path
      end
    end


end
