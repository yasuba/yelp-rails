class ReviewsController < ApplicationController

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      review = @restaurant.reviews.create(params[:review].permit(:rating, :review))
      review.user = current_user
      puts review
      review.save
      redirect_to restaurant_path(@restaurant)
    end


end
