class BikesController < ApplicationController

  before_action :find_bike, only: [:show, :edit, :update, :destroy]

    def index
      @bikes = Bike.all
    end

    def show
      @bikes = Bike.all
      @reviews = Review.all
      # @review = Review.find(params[:review_id])
      @location = Location.find(params[:location_id])
      @alert_message = "You are viewing #{@bike.make}"
      @bikes = @bikes.select{ |b| b.latitude }
      @markers = Gmaps4rails.build_markers(@bike) do |bike, marker|
        marker.lat bike.latitude
        marker.lng bike.longitude
      end
    end



    def new
      @bike = location.bikes.new
    end

    def create
      @bike = location.bikes.build(bike_params)
      @bike.user = current_user
      if @bike.save
        redirect_to location_bike_path(location, @bike)
      else
        render :new
      end
    end

    def edit
    end

    def update
      # @bike = Bike.update(bike_params)
    end

    def destroy
      @bike.destroy
    end

    def search
      @bikes = Bike.where(location_id: params[:location_id])

      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date


      @bikes.each do |bike|
        bike.bookings.each do |booking|
          booking_start = booking.start_date
          booking_end = booking.end_date
          if (start_date > booking_start && start_date < booking_end) || (end_date > booking_start && end_date < booking_end) || (start_date < booking_start && end_date > booking_start)
            @bikes = @bikes.reject{|b| b.id == bike.id }
            break
          end
        end
      end
    @bikes
    end

  private

    def bike_params
      params.require(:bike).permit(:make, :model, :engine, :year, :bike_type, :rate_daily, :address, :bike_image)
    end

    def location
      @location = Location.find(params[:location_id])
    end

    def find_bike
      @bike = Bike.find(params[:id])
    end
end
