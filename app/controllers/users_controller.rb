class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    # instantiates the user with params
    @user = User.new(user_params)
    # if users fields pass validations it will save the user
    if @user.save
      # log the user in
      session[:user_id] = @user.id
      # redirect to show page
      redirect_to @user
    else
      # redirect them to the signup page again
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    # finds current user
    @user = User.find_by_id(params[:id])
    # redirects to home page if user isn't logged in
    redirect_to '/' if !@user
  end

  private
  # strong params
  def user_params #will require these params and permit only these are editted by users in the front end
    params.require(:user).permit(:username, :email, :password)
  end
end
