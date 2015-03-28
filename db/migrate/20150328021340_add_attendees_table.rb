class AddAttendeesTable < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :email
      t.boolean :pre_auth?
      t.references :event, index: true
      t.references :contact, index: true
    end
  end
end
