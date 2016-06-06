class ProfilesController < ApplicationController
  before_action :find_user, only:[:edit, :update]

  def show
    @profile = current_user.profile
    @bookings = current_user.bookings
    @all_bookings = Booking.all
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to user_profile_path(@profile)
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(:profile_image, :name, :address)
  end
end
