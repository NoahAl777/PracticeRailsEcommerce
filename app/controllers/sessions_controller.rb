class SessionsController < ApplicationController

  def new

  end

  def home

  end

  def create
    # look for user in database and authenticate
    @user = User.find_by(:username => params[:username])
    # if @user is !nil and passes authentication
    if @user && @user.authenticate(params[:password])
      # log the user in
      session[:user_id] = @user.id
      # redirect to home page
      redirect_to "/"
    else
      flash[:message] = "User not found."
      # redirect them to the login page again
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
