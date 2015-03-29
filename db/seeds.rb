# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



contact1 = Contact.create(email: "godutchteam@gmail.com", firstname: "Emily", lastname: "Craig", user_id: 1);
contact2 = Contact.create(email: "godutchteam@gmail.com", firstname: "Gabby", lastname: "Leung", user_id: 1);
contact3 = Contact.create(email: "godutchteam@gmail.com", firstname: "Maggie", lastname: "Moss", user_id: 1);

User.create(firstname: 'Gabby', lastname: 'Leung', email: 'godutchteam@gmail.com', password: '123')
User.create(firstname: 'Emily', lastname: 'Craig', email: 'godutchteam@gmail.com', password: '123')
User.create(firstname: 'Maggie', lastname: 'Moss', email: 'godutchteam@gmail.com', password: '123')
