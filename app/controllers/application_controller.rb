class ApplicationController < ActionController::Base
  
  # gives access to methods in the views
  helper_method :current_user, :logged_in?

  private
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      # only makes a call to db if there is a user session id
    end

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
      redirect_to '/'
      flash[:not_logged_in] = "You must be logged in to see this page."
      end
    end
end
