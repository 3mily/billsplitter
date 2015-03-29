class AddEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.integer :cost
      t.boolean :closed, default: false
      t.datetime :start
      t.datetime :end
      t.references :user, index: true
    end
  end
end
