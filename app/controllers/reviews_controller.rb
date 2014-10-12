class ReviewsController < ApplicationController

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @restaurant.reviews.create(params[:review].permit(:rating, :review))
        redirect_to restaurant_path(@restaurant)
    end

end
