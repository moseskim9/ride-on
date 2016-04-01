class LocationsController < ApplicationController

  def index
    @locations = Location.all
    if params[:location_id]
      @location = Location.find(params[:location_id])
      redirect_to location_path(@location)
    end
  end

  def show
    @location = Location.find(params[:id])
    @bikes = Bike.all
      # @review = Review.find(params[:review_id])
    @bikes = @bikes.select{ |b| b.latitude }
    @markers = Gmaps4rails.build_markers(@bikes) do |bike, marker|
      marker.lat bike.latitude
      marker.lng bike.longitude
    end
  end



  # def new
  #   @bike = Bike.find(params[:bike_id])
  #   @location = @bike.locations.new
  # end

  # def create
  #   @bike = Bike.find(params[:bike_id])
  #   @location = @bike.locations.build(location_params)
  #   if @location.save!
  #     redirect_to locations_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  # private

  # def location_params
  #   params.require(:location).permit(:country, :city)
  # end

end
