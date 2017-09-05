class SessionsController < ApplicationController

  skip_before_action :authenticate!, only: [:new, :create]

  def new
    @account = Account.new
  end

  def create
    @account = Account.find_by(email: account_params[:email])

    if @account.authenticate(account_params[:password])
      session[:account_id] = @account.id

      redirect_to root_path
    else
      @account.errors.add(:password, :invalid)
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def account_params
    params.require(:account).permit(:email, :password)
  end
end
