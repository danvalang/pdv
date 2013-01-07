class SessionsController < ApplicationController
  before_filter :require_login, except: :destroy

  def require_login
    if current_user
      if current_user.is_admin
        redirect_to fases
      else
        redirect_to pdvs
      end
    end
  end

  def new
    render "new"
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      if current_user.is_admin
        redirect_to fases_path, :notice => "Logged in!"
      else
        redirect_to pdvs_path, :notice => "Logged in!"
      end
    else
      flash.notice = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    flash.notice = "Logged Out"
    render "new"
  end
end
