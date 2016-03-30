class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
    before_action :find_current_user, only: [:index, :show, :create, :user_bookings]

  def index
    @bookings = Booking.all
    @user_bookings = @current_user.bookings
  end

  def show
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @location = Location.find(params[:location_id])
    @booking = @bike.bookings.new
  end

  def create
    @bike = Bike.find(params[:bike_id])
    @location = Location.find(params[:location_id])
    @booking = @bike.bookings.build(booking_params)
    if @booking.save
      redirect_to location_bike_booking_path(@location, @bike, @booking)
    else
      render :new
    end
  end

  def edit
    @bike = Bike.find(params[:bike_id])
  end

  def update
    @bike = Bike.find(params[:bike_id])
    @booking.update(booking_params)
    redirect_to bike_booking_path(@bike, @booking)
  end

  def destroy
    @booking.destroy
  end



  private

  def find_current_user
    @current_user = current_user
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:end_date, :start_date)
  end

end
