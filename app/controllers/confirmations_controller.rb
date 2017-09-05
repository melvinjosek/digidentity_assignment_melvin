class ConfirmationsController < ApplicationController
  def new

  end

  def create
    current_account.profiles.confirm_all
    current_account.addresses.confirm_all

    redirect_to root_path, notice: 'Successfully registered'
  end
end
