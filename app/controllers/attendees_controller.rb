require 'pry'
require 'mandrill'

class AttendeesController < ApplicationController

  def create
  	@event = current_user.events.last
    @invite_list = params["my-select"]

		@invite_list.each do |id|	
			invitee = Contact.find(user_id = id)
			r_email = invitee.email
			r_firstname = invitee.firstname
			attendee = Attendee.create(email: invitee.email, contact_id: invitee.id, event_id: @event.id );
			attendee_id = attendee.id.to_s

			# email_body = "<html><head><style> div { font-family: 'Open Sans', sans-serif; color: #111; border: solid 2px #81B7FF, padding: 10px} h2 { background-color: #81B7FF, padding: 10px, font-size: 20px; color: #fff; } a { font-size: 14px; color: #60c0ac; text-decoration: none; } </style></head><body>
				# <div><h2>Hey <strong>"+attendee.contact.firstname+"</strong>, how are you?</h2><p> You've been invited by <strong>"+current_user.firstname+"</strong> to the event <strong>"+attendee.event.name+"</strong> on Go Dutch! <a href='http://localhost:3000/payments/new/"+attendee_id+"'>Follow this link to participate!</a><p><br></div></body></html>"
				email_body = "<html><head><style>#content{height: 100%}#invite{background-color: #81B7FF;padding: 30px;text-align: center;}h1{color: white;font-family: arial}
	    					#message {position: relative;text-align: center;font-family: arial;padding-bottom: 100px}a {text-decoration: none;color: white;font-family: arial;}
    						#link {background-color: #81B7FF;padding: 10px;width: 50px; margin: 0 auto;}#link:hover {background-color: black;} p{font-size: 20px;}</style></head>
							<body><div id='content'><div id='invite'><h1> You're Invited! </h1></div><div id='message'><p> Hello, <strong>"+attendee.contact.firstname+"</strong><p><br><p><strong> "+current_user.firstname+"</strong> has invited you to <strong>"+attendee.event.name+" </strong>	via GoDutch. <p><br><p> To RSVP and pre-authorize payment for your admission, follow the link below. </p><div id='link'><a href='http://localhost:3000/payments/new/"+attendee_id+"'>RSVP</a></div></div><hr></div></body>"

	    m = Mandrill::API.new
			message = {  
			 :subject=> "Hey "+r_firstname+", wanna go to "+attendee.event.name+"?",  
			 :from_name=> "Go Dutch App",  
			 :text=>"Hi, how are you?",  
			 :to=>[  
			   {  
			     :email=> r_email, 
			     :name=> r_firstname  
			   }  
			 ],  
			 :html=>email_body,  
			 :from_email=>"godutchteam@gmail.com"  
			}  
			sending = m.messages.send message  
			puts sending
	  end
		response.headers['X-PJAX-URL'] = "http://localhost:3000/events/confirmation"
	  render 'events/confirmation'
	end 
end