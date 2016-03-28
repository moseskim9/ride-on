class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    booking = Booking.new(booking_params)
  if booking.save
    redirect_to booking_path(@booking)
  else
    render :new
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@restaurant)
  end

  def destroy
    @booking.destroy
  end


  def find_booking
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end

end
