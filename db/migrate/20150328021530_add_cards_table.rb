class AddCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.integer :cvv
      t.string :expiry
      t.string :fullname
      t.references :user, index: true
    end
  end
end
