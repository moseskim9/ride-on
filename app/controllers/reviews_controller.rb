class ReviewsController < ApplicationController
  before_action :find_review, only: [:show]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = @booking.reviews.build(review_params)
    if @review.save
      redirect_to booking_path(@booking)
    else
      redirect_to booking_path
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
