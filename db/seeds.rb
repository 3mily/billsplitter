# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



contact1 = Contact.create(email: "godutchteam@gmail.com", firstname: "Daniel", lastname: "Craig", user_id: 1);
contact2 = Contact.create(email: "neko_ff6@yahoo.com", firstname: "Gabby", lastname: "Leung", user_id: 1);
contact3 = Contact.create(email: "godutchteam@gmail.com", firstname: "Maggie", lastname: "Moss", user_id: 1);
contact1 = Contact.create(email: "godutchteam@gmail.com", firstname: "Wesley", lastname: "Yu", user_id: 1);


User.create(firstname: 'Emily', lastname: 'Craig', email: 'godutchteam1@gmail.com', password: '123')
User.create(firstname: 'Gabby', lastname: 'Leung', email: 'godutchteam2@gmail.com', password: '123')
User.create(firstname: 'Maggie', lastname: 'Moss', email: 'godutchteam3@gmail.com', password: '123')
