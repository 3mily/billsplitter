class SessionsController < ApplicationController

  def create
    # user = User.find_by(email: params[:email])

    # if user && user.authenticate(params[:password])
      # debugger
      # session[:user_id] = user.id
      # debugger
      render '/events/details'
    # else
      # flash[:alert] = "Login failed!"
      # debugger
    # end
  end

  def destroy
    session[:user_id] = nil
    # render login.
  end

end
