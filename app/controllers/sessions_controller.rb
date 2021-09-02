class SessionsController < ApplicationController

  def omniauth
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.email = auth['info']['email']
      u.username = auth['info']['name']
      u.password = SecureRandom.hex[15]
    end
    if user.valid?
      session[:user_id] = user.id
      flash[:message] = "Succesful Login!"
      redirect_to posts_path
    else
      flash[:login_fail] = "Your Login Attempt Failed! Try Again"
    end
  end

  def create
    # look for user in database and authenticate
    @user = User.find_by(:username => params[:username])
    # if @user is !nil and passes authentication
    if @user && @user.authenticate(params[:password])
      # log the user in
      session[:user_id] = @user.id
      # redirect to home page
      redirect_to @user
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

  private
    def auth
      request.env['omniauth.auth']
    end
end
