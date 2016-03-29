class ProfilesController < ApplicationController
  before_action :find_profile, only:[:edit, :update]

  def show
    @profile = current_user.profile
  end

  def edit

  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def find_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:profile_image, :name, :address)
  end
end
