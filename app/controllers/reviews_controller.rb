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
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = @booking.reviews.build(review_params)
    if @review.save
      redirect_to booking_path(@booking)
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
