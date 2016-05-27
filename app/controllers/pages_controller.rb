class PagesController < ApplicationController
  def welcome
    @locations = Location.all
    @latest_bikes = Bike.latest
    @bookings = Booking.all
    @bikes = Bike.all
  end

  def search
    @bikes = Bike.where(location_id: params[:location_id])
    @location = Location.find(params[:location_id])

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

end
