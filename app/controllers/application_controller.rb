class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate!

  private

  def current_account
    @current_account ||= Account.find_by(id: session[:account_id])
  end

  helper_method :current_account

  def authenticate!
    unless current_account
      redirect_to sign_in_path
    end
  end
end
