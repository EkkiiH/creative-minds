# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Task.destroy_all
Plan.destroy_all
User.destroy_all

puts 'creating 2 users...'
user1 = User.create!(
  email: "aaa@aaa.aaa",
  password: "123456"
)

user2 = User.create!(
  email: "bbb@bbb.bbb",
  password: "123456"
)
puts 'Succesful creation of 2 users!'

puts 'Creating 5 plans...'
plan1 = Plan.new(
  name: "Trip to Las Vegas",
  description: "Going with the familly to USA Las Vegas",
  start_date: Time.strptime('06/30/2024 09:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('07/10/2024 12:00', '%m/%d/%Y %H:%M'),
  user: user1
)
plan1.save!

plan2 = Plan.new(
  name: "Create a website",
  description: "Creating a website to have an internet presence ",
  start_date: Time.strptime('11/01/2023 09:00', '%m/%d/%Y %H:%M'),
  end_date: "",
  user: user1
)
plan2.save!

plan3 = Plan.new(
  name: "Make a logo",
  description: "Create a logo to have a unique visual identity",
  start_date: Time.strptime('10/01/2023 09:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('11/01/2023 18:00', '%m/%d/%Y %H:%M'),
  user: user1
)
plan3.save!

plan4 = Plan.new(
  name: "Having a interior garden",
  description: "Decorate the interior of the house with plants",
  start_date: "",
  end_date: Time.strptime('09/27/2023 09:00', '%m/%d/%Y %H:%M'),
  user: user2
)
plan4.save!

plan5 = Plan.new(
  name: "Write a novel",
  description: "Bring all my ideas into a big action novel",
  start_date: "",
  end_date: Time.strptime('09/01/2025 00:00', '%m/%d/%Y %H:%M'),
  user: user2
)
plan5.save!
puts 'Succesful creation of 5 plans!'

puts 'create 10 tasks...'
Task.create!(
  activity: "Buy the tickets",
  completion: false,
  priority: 0,
  due_date: Time.strptime('07/01/2024 09:00', '%m/%d/%Y %H:%M'),
  plan: plan1
)

Task.create!(
  activity: "Buy the luggages",
  completion: true,
  priority: 1,
  due_date: Time.strptime('10/01/2024 09:00', '%m/%d/%Y %H:%M'),
  plan: plan1
)

Task.create!(
  activity: "Buy a host and domain",
  completion: true,
  priority: 1,
  due_date: Time.strptime('11/01/2023 09:00', '%m/%d/%Y %H:%M'),
  plan: plan2
)

Task.create!(
  activity: "Create a design",
  completion: false,
  priority: 0,
  due_date: Time.strptime('11/15/2023 09:00', '%m/%d/%Y %H:%M'),
  plan: plan2
)

Task.create!(
  activity: "gather some inspiration",
  completion: false,
  priority: 0,
  due_date: "",
  plan: plan3
)

Task.create!(
  activity: "buy some plants",
  completion: false,
  priority: 2,
  due_date: Time.strptime('09/24/2023 14:00', '%m/%d/%Y %H:%M'),
  plan: plan4
)

Task.create!(
  activity: "Make some space in the living room",
  completion: true,
  priority: 1,
  due_date: Time.strptime('09/20/2023 14:00', '%m/%d/%Y %H:%M'),
  plan: plan4
)

Task.create!(
  activity: "make a schema of the content",
  completion: true,
  priority: 0,
  due_date: "",
  plan: plan5
)

Task.create!(
  activity: "Set a meeting with some folks to interview",
  completion: false,
  priority: 1,
  due_date: "",
  plan: plan5
)

Task.create!(
  activity: "Rent a place in the wood to write during the holidays",
  completion: true,
  priority: 2,
  due_date: "",
  plan: plan5
)
puts 'Succesful creation of 10 tasks!'
