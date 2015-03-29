require 'pry' 

class PaymentsController < ApplicationController

	def new
		puts "NEW WAS CALLED"
		attendee_id = params["id"].to_i
		@attendee = Attendee.find(attendee_id)
		# binding.pry
		@event = Event.find(@attendee.event.id)
		# binding.pry

		# get cost from event - convert it to cents
		# @event = @attendee.event_id
		# @stripe_key = @event.user_id.stripe_key
	end

	def create
		Stripe.api_key = ENV['STRIPE_SECRET_KEY']

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		attendee = Attendee.find(params["id"].to_i)
		event = Event.find(attendee.event.id)
		if event.cost.nil?
			event.cost = 17 #cause 17 is cool and arbitrary
		end
		total_cost = event.cost * 100
		
		charge = Stripe::Charge.create(
        :amount => total_cost, 
        :currency => "cad",
        :card => token,
        :description => "description of payment",
		    :capture => false
		    )
    charge.save

    attendee.charge_id = charge.id
    attendee.save


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