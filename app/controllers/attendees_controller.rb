class AttendeesController < ApplicationController

  def create
    response.headers['X-PJAX-URL'] = "http://localhost:3000/events/confirmation"
    render 'events/confirmation'

  end


end