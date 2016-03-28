class BikesController < ApplicationController
  before_action :find_bike, only: [:show, :edit, :update, :destroy]

    def index
      @bikes = Bike.all
    end

    def show
    end

    def new
      @bike = Bike.new
    end

    def create
      @booking = Booking.find(params[:booking_id])
      @bike = @booking.bikes.build(bike_params)
        if @bike.save
      redirect_to bikes_path
        else
      redirect_to
        end
    end

    def edit
    end

    def update
      @bike = Bike.update(bike_params)
    end

    def destroy
      @bike.destroy
    end

  private

    def bike_params
      params.require(:bike).permit(:make, :model, :engine, :year, :type, :rate_daily, :bike_image)
    end


    def find_bike
        @bike = Bike.find(params[:id])
    end
end
