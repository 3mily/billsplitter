class AttendeesController < ApplicationController

  def create
    @invite_list = params["my-select"]
    response.headers['X-PJAX-URL'] = "http://localhost:3000/events/confirmation"
    render 'events/confirmation'
  end
end