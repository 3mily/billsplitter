class EventsController < ApplicationController

  def new
    render :eventform
  end

  def create
    @contacts = Contact.all

    @event = Event.new
    start_time = @event.format_datetime(params["start_date"],params["start_time"])
    end_time = @event.format_datetime(params["end_date"],params["end_time"])
    @event.name = params["Name"]
    @event.location = params["Location"]
    @event.cost = params["Cost"]
    @event.start = start_time
    @event.end = end_time
    @event.save
    response.headers['X-PJAX-URL'] = "http://localhost:3000/events/invite"
    render :inviteform
  end




end
