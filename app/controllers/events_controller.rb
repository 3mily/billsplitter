require 'pry'

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

  def update
    @event = Event.find(params[:event_id])

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    @event.attendees.each do |attendee|
       if attendee.charge_id != nil
          charge = Stripe::Charge.retrieve(attendee.charge_id)
          charge.capture  
      end
    end
    # @event.closed? = true
    # @event.save!  
  end
end

