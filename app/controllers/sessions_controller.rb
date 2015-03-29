class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])

      session[:user_id] = user.id

      response.headers['X-PJAX-URL'] = "http://localhost:3000/events/details"
      render '/events/details'
    else
      flash[:alert] = "Login failed!"
      binding.pry
    end
  end

  def destroy
    session[:user_id] = nil
    # render login.
  end

end
