class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
    before_action :find_current_user, only: [:index, :show, :create, :user_bookings]

  def index
    @bookings = Booking.all
    @user_bookings = @current_user.bookings
  end

  def user_bookings

  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = @user.bookings.build(booking_params)
    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path(@booking)
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
