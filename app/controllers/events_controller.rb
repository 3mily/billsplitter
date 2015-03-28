class EventsController < ApplicationController

  def new
    render :eventform
  end

  def create
    @contacts = Contact.all
    @event = Event.new
    s_hour = params["start_time"]["hour"]
    s_minute = params["start_time"]["minute"]
    s_time = s_hour + ":" + "s_minute"
    e_hour = params["end_time"]["hour"]
    e_minute = params["end_time"]["minute"]
    e_time = e_hour + ":" + "e_minute"
    @event.name = params["Name"]
    @event.location = params["Location"]
    @event.cost = params["Cost"]
    @event.start = s_time
    @event.end = e_time

    @event.save
    response.headers['X-PJAX-URL'] = "http://localhost:3000/events/invite"
    render :inviteform
  end
end
