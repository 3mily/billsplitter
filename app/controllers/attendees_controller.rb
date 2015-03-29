require 'pry'

class AttendeesController < ApplicationController

  def create
    @invite_list = params["my-select"]

		require 'mandrill'

		@invite_list.each do |id|	
			invitee = Contact.find(user_id = id)
			r_email = invitee.email
			r_firstname = invitee.firstname
			email_body = "<html><h1>Hi <strong>message</strong>, how are you?</h1><p> You've been invited to an event on Go Dutch! Follow the link here to participate: localhost:3000/payments/new/"+id+"<p></html>"
	    m = Mandrill::API.new
			message = {  
			 :subject=> "Hello, "+r_firstname,  
			 :from_name=> "Your name",  
			 :text=>"Hi message, how are you?",  
			 :to=>[  
			   {  
			     :email=> "godutchteam@gmail.com", #should be r_email  
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