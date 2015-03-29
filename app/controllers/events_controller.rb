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
    @event.details = params["Description"]
    @event.start = start_time
    @event.end = end_time
    @event.user_id = current_user.id
    @event.save
    response.headers['X-PJAX-URL'] = "http://localhost:3000/events/invite"
    render :inviteform
  end

  def update

    event = Event.find(params['id'])
    event.closed = true
    event.save

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    event.attendees.each do |attendee|

       if attendee.charge_id != nil
          charge = Stripe::Charge.retrieve(attendee.charge_id)
          charge.capture
          paid_email(attendee)
      end
    end

    render :details

  end

  def destroy
    event = Event.find(params['id'])
    event.destroy
    render :details
  end

  def details
    @events = Event.all
    @closed = 0
    @open = 0
  end

  def paid_email(attendee)
    binding.pry
    attendee_name = attendee.contact.firstname
    email_body = "<html>Hey <strong>"+attendee_name+"</strong>, we've received your payment of $"+attendee.event.cost.to_s+"! Thanks for paying your friend back! </html>"
    m = Mandrill::API.new
    message = {  
     :subject=> "Hey "+attendee_name+", we've received your payment now!",
     :from_name=> attendee.event.user.firstname,  
     :text=>"Hello you!",  
     :to=>[  
       {  
         :email=> "godutchteam@gmail.com", #should be r_email  
         :name=> attendee_name 
       }  
     ],  
     :html=>email_body,  
     :from_email=>"godutchteam@gmail.com"  
    }  
    sending = m.messages.send message 
  end





end

