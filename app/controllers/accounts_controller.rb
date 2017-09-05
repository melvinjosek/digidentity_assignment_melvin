class AccountsController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      session[:account_id] = @account.id
      redirect_to new_profile_path, notice: 'Account was successfully created.'
    else
      render :new
    end
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:email, :password)
  end
end
