# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	STOCK_PHOTOS = [
		'stock_photo1.jpg',
		'stock_photo2.jpg',
		'stock_photo3.jpg',
		'stock_photo4.jpg',
		'stock_photo5.jpg',
		'stock_photo6.jpg',
		'stock_photo7.jpg',
		'stock_photo8.jpg',
		'stock_photo9.jpg'
	]


User.create([
	{
		first_name: "Albert",
		last_name: "Hong",
		email: "a@gmail.com",
		slack_id: "kdmasd",
		description: "Just a dude bein' a dude",
		username: "Alby the Racist Dragon",
		small_picture: "",
		profile_picture: ""
	},
	{
		first_name: "John",
		last_name: "Smith",
		email: "js@gmail.com",
		slack_id: "asd70d",
		description: "Who am I?",
		username: "The Real John Smith",
		small_picture: "",
		profile_picture: ""
	},
	{
		first_name: "Peter",
		last_name: "Parker",
		email: "spidey@gmail.com",
		slack_id: "8yfh7sdc",
		description: "An unassuming, everday kid",
		username: "Spidey Senses",
		small_picture: "",
		profile_picture: ""
	}
	])

Topic.create([
	{name: "Rails"},
	{name: "SQL"},
	{name: "Javascript"},
	{name: "ORMs"}
	])
	

p1 = Post.new(picture_path: STOCK_PHOTOS.sample, title: "Trouble with Rails", compensation: "Burrito", length: "90 minutes", deadline: Date.today + 6.days, description: "Help me out, get a delicious burrito")
p2 = Post.new(picture_path: STOCK_PHOTOS.sample, title: "Wut", compensation: "3 tacos", length: "70 minutes", deadline: Date.today + 2.days, description: "No idea what I'm doing")
p3 = Post.new(picture_path: STOCK_PHOTOS.sample, title: "Halp", compensation: "Falafel sandwich", length: "80 minutes", deadline: Date.today + 4.days, description: "Don't know what's wrong with my code")
p4 = Post.new(picture_path: STOCK_PHOTOS.sample, title: "Small issue", compensation: "Homemade Cookies", length: "30 minutes", deadline: Date.today + 2.days, description: "Little problem with forms")
p5 = Post.new(picture_path: STOCK_PHOTOS.sample, title: "Gonna fail", compensation: "Steak", length: "120 minutes", deadline: Date.today + 9.days, description: "Oh god I don't know what I'm doing")
p6 = Post.new(picture_path: STOCK_PHOTOS.sample, title: "Refactor", compensation: "Sushi", length: "45 minutes", deadline: Date.today + 10.days, description: "Not sure how to begin refactoring")


p1.student = User.all[0]
p1.topic = Topic.all[0]
p1.save

p2.student = User.all[0]
p2.topic = Topic.all[1]
p2.save

p3.student = User.all[1]
p3.topic = Topic.all[2]
p3.save

p4.student = User.all[2]
p4.topic = Topic.all[1]
p4.save

p5.student = User.all[2]
p5.topic = Topic.all[3]
p5.save

p6.student = User.all[2]
p6.topic = Topic.all[2]
p5.save



