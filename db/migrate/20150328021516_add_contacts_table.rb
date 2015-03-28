class AddContactsTable < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.references :user, index: true
    end
  end
end
