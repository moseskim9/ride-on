class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]

  def index
    @booking = Booking.find(params[:booking_id])
    @reviews = Review.all
  end

  def show
    @booking = Booking.find(params[:booking_id])
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @location = Location.find(params[:location_id])
    @review = @bike.reviews.new
  end

  def create
    @location = Location.find(params[:location_id])
    @bike = Bike.find(params[:bike_id])
    @review = @bike.reviews.build(review_params)
    if @review.save
      redirect_to location_bike_path(@location, @bike, @review)
    else
      render :new
    end
  end

# CHECK BOOKING_ID FROM THE ROUTES

  def find_review
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
