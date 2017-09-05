class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_account.profiles.new(profile_params)

    if @profile.save
      redirect_to new_address_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :surname, :date_of_birth)
  end
end
