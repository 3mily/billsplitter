require 'pry'

class EventsController < ApplicationController

  def new
    render :eventform
  end

  def create
    @contacts = Contact.all

    @event = Event.new
    start_time = @event.format_datetime(params["start_date"],params["start_time"])
    @event.name = params["Name"]
    @event.location = params["Location"]
    @event.cost = params["Cost"]
    @event.details = params["Description"]
    @event.start = start_time
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
    email_body = "<html><head><style>#content{height: 100%}#invite{background-color: #81B7FF;padding: 30px;text-align: center;}h1{color: white;font-family: arial}
                #message {position: relative;text-align: center;font-family: arial;padding-bottom: 100px}a {text-decoration: none;color: white;font-family: arial;}
                #link {background-color: #81B7FF;padding: 10px;width: 50px; margin: 0 auto;}#link:hover {background-color: black;} p{font-size: 20px;}</style></head>
              <body><div id='content'><div id='invite'><h1>Hey <strong>"+attendee.contact.firstname+"!</strong></h1></div><div id='message'><p>We're received your payment of $<strong>"+attendee.event.cost.to_s+"</strong> for <strong>"+attendee.event.name+"</strong>.<br>Thanks for paying your friend back!</div></div></body>"

    m = Mandrill::API.new
    message = {  
     :subject=> "Hey "+attendee.contact.firstname+", we've received your payment now!",
     :from_name=> attendee.event.user.firstname,  
     :text=>"Hello you!",  
     :to=>[  
       {  
         :email=> attendee.email, #should be r_email  
         :name=> attendee.contact.firstname
       }  
     ],  
     :html=>email_body,  
     :from_email=>"godutchteam@gmail.com"  
    }  
    sending = m.messages.send message 
  end





end

