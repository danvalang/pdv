class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
    if  current_user
      redirect_to root_url, :notice => "Signed up!"
    else
      @user = User.new(params[:user])
      if @user.save
        redirect_to root_url, :notice => "Signed up!"
      else
        render "new"
      end
    end
  end
end
