class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :require_login, :only => :sessions;
  before_filter :require_login
  def require_login

    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path # halts request cycle
    end
  end

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  def current_user?
    true if (current_user || User.find_by_auth_token!(cookies[:auth_token]))
  end

  helper_method :current_user
  helper_method :current_user?
end
