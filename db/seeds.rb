# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.new(username: "bertrumius", email: "bert@hertian.com", password: "test", password_confirmation: "test",protect_tweets: false, full_name: "Bertia Hern", location: "Barcelona", web_site: "http://mememe.com", bio: "my bio is viole")
user2 = User.new(username: "mugginsk", email: "bart@faz.com", password: "test", password_confirmation: "test",protect_tweets: false, full_name: "Morgan Thas", location: "Chicago", web_site: "http://you.com", bio: "boring boring me")
user3 = User.new(username: "turdle", email: "lubbie@fadz.com", password: "test", password_confirmation: "test",protect_tweets: true, full_name: "Blub Tub", location: "Indianapols", web_site: "http://bugg.com", bio: "silly fun me")
user1.save
user2.save
user3.save

5.times do |x|
  b1 = Blurt.new
  b2 = Blurt.new
  b3 = Blurt.new
  b1.body = Faker::Lorem.sentence
  b2.body = Faker::Lorem.sentence
  b3.body = Faker::Lorem.sentence
  user1.blurts << b1
  user2.blurts << b2
  user3.blurts << b3
  user1.save
  user2.save
  user3.save
end

SpecialWord.create(name:"monkey")
SpecialWord.create(name:"elephant")
SpecialWord.create(name:"whale")
SpecialWord.create(name:"human")