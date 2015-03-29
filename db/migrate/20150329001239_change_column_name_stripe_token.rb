class ChangeColumnNameStripeToken < ActiveRecord::Migration
  def change
  	rename_column :attendees, :stripe_token, :charge_id
  end
end
