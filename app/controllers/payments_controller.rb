require 'pry' 

class PaymentsController < ApplicationController

	def new
		puts "NEW WAS CALLED"
		attendee_id = params["id"]
		attendee = Contact.find(id = attendee_id)
		@contact_firstname = attendee.firstname
		@user_id = attendee.user_id
		event = Event.find(user_id = @user_id)
		@event_name = event.name
		@cost = event.cost
		binding.pry

		# get cost from event - convert it to cents
		# @event = @attendee.event_id
		# @stripe_key = @event.user_id.stripe_key
	end

	def create
		Stripe.api_key = ENV['STRIPE_SECRET_KEY']

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create a Customer
		# customer = Stripe::Customer.create(
		#   :source => token,
		#   :description => "payinguser@example.com"
		# )

		# Charge the Customer instead of the card

		
		charge = Stripe::Charge.create(
        :amount => 100,
        :currency => "cad",
        :card => token,
        :description => "description of payment",
		    :capture => false
		    )
    charge.save

		# Save the customer ID in your database so you can use it later
		# attendee.stripe_token = charge.id
		# save_stripe_customer_id(user, customer.id)

		# should save change attendee's payment status.

		# Later...
		# customer_id = get_stripe_customer_id(user)

		# Stripe::Charge.create(
		#   :amount   => 1500, # $15.00 this time
		#   :currency => "cad",
		#   :customer => customer_id
		# )

		render :create
	end



end