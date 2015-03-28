class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      flash[:alert] = "Login failed!"
    end
  end

  def destroy
    session[:user_id] = nil
    # render login.
  end

end
