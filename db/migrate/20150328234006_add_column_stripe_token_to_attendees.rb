class AddColumnStripeTokenToAttendees < ActiveRecord::Migration
  def change
  	add_column :attendees, :stripe_token, :string
  end
end
