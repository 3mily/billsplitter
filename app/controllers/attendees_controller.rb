require 'pry'

class AttendeesController < ApplicationController

  def create

  	@invite_list = params["my-select"]

  	binding.pry

		require 'mandrill'
    m = Mandrill::API.new
		message = {  
		 :subject=> "Hello from the Mandrill API",  
		 :from_name=> "Your name",  
		 :text=>"Hi message, how are you?",  
		 :to=>[  
		   {  
		     :email=> "godutchteam@gmail.com",  
		     :name=> "Recipient1"  
		   }  
		 ],  
		 :html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",  
		 :from_email=>"godutchteam@gmail.com"  
		}  
		sending = m.messages.send message  
		puts sending

    response.headers['X-PJAX-URL'] = "http://localhost:3000/events/confirmation"
    render 'events/confirmation'
  end
end