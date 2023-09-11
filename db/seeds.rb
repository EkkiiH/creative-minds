# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Subtask.destroy_all
Task.destroy_all
Plan.destroy_all
User.destroy_all

puts 'creating 2 users...'
user1 = User.create!(
  email: "aaa@aaa.aaa",
  password: "123456",
  first_name: "Stan",
  last_name: "Lee"
)

user2 = User.create!(
  email: "bbb@bbb.bbb",
  password: "123456",
  first_name: "Oprah",
  last_name: "Winfrey"
)
puts 'Succesful creation of 2 users!'

puts 'Creating 9 plans...'
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

# adding 2 more plans for each user

plan6 = Plan.new(
  name: "Attend a Wedding",
  description: "John Doe Wedding in Paris",
  start_date: "",
  end_date: Time.strptime('05/01/2024 00:00', '%m/%d/%Y %H:%M'),
  user: user2
)
plan6.save!

plan7 = Plan.new(
  name: "Join Le Wagon Bootcamp",
  description: "Data Science Bootcamp",
  start_date: "",
  end_date: Time.strptime('06/01/2024 00:00', '%m/%d/%Y %H:%M'),
  user: user2
)
plan7.save!

plan8 = Plan.new(
  name: "Christmas Party at Office",
  description: "No office hours, but full-day party",
  start_date: "",
  end_date: Time.strptime('11/1/2023 00:00', '%m/%d/%Y %H:%M'),
  user: user1
)
plan8.save!

plan9 = Plan.new(
  name: "New Year Celebration with extended Family",
  description: "It is held at Uncle Sam House",
  start_date: "",
  end_date: Time.strptime('1/12/2023 00:00', '%m/%d/%Y %H:%M'),
  user: user1
)
plan9.save!
puts 'Succesful creation of 9 plans!'



puts 'create 18 tasks...'
task1 = Task.new(
  activity: "Buy the tickets",
  completion: false,
  priority: 0,
  due_date: Time.strptime('07/01/2024 09:00', '%m/%d/%Y %H:%M'),
  plan: plan1
)
task1.save!

task2 = Task.new(
  activity: "Buy the luggages",
  completion: true,
  priority: 1,
  due_date: Time.strptime('10/01/2024 09:00', '%m/%d/%Y %H:%M'),
  plan: plan1
)
task2.save!

task3 = Task.new(
  activity: "Buy a host and domain",
  completion: true,
  priority: 1,
  due_date: Time.strptime('11/01/2023 09:00', '%m/%d/%Y %H:%M'),
  plan: plan2
)
task3.save!

task4 = Task.new(
  activity: "Create a design",
  completion: false,
  priority: 0,
  due_date: Time.strptime('11/15/2023 09:00', '%m/%d/%Y %H:%M'),
  plan: plan2
)
task4.save!

task5 = Task.new(
  activity: "gather some inspiration",
  completion: false,
  priority: 0,
  due_date: "",
  plan: plan3
)
task5.save!

task6 = Task.new(
  activity: "buy some plants",
  completion: false,
  priority: 2,
  due_date: Time.strptime('09/24/2023 14:00', '%m/%d/%Y %H:%M'),
  plan: plan4
)
task6.save!

task7 = Task.new(
  activity: "Make some space in the living room",
  completion: true,
  priority: 1,
  due_date: Time.strptime('09/20/2023 14:00', '%m/%d/%Y %H:%M'),
  plan: plan4
)
task7.save!

task8 = Task.new(
  activity: "make a schema of the content",
  completion: true,
  priority: 0,
  due_date: "",
  plan: plan5
)
task8.save!

task9 = Task.new(
  activity: "Set a meeting with some folks to interview",
  completion: false,
  priority: 1,
  due_date: "",
  plan: plan5
)
task9.save!

task10 = Task.new(
  activity: "Rent a place in the wood to write during the holidays",
  completion: true,
  priority: 2,
  due_date: "",
  plan: plan5
)
task10.save!
# added more tasks starting from this line....

# Attend a Wedding
task11 = Task.new(
  activity: "Buy a formal party gown",
  completion: false,
  priority: 1,
  due_date: "",
  plan: plan6
)
task11.save!

# Attend a Wedding
task12 = Task.new(
  activity: "Buy a wedding gift for Joe",
  completion: true,
  priority: 2,
  due_date: "",
  plan: plan6
)
task12.save!

# Join Le Wagon Bootcamp
task13 = Task.new(
  activity: "Pass the interview and quiz",
  completion: false,
  priority: 0,
  due_date: "",
  plan: plan7
)
task13.save!

# Join Le Wagon Bootcamp
task14 = Task.new(
  activity: "Preparation and study for the quiz",
  completion: true,
  priority: 0,
  due_date: "",
  plan: plan7
)
task14.save!

# Christmas Party at Office
task15 = Task.new(
  activity: "Buy a gift for the gift exchange",
  completion: false,
  priority: 0,
  due_date: "",
  plan: plan8
)
task15.save!

# Christmas Party at Office
task16 = Task.new(
  activity: "Buy a Christmas Sweater",
  completion: false,
  priority: 2,
  due_date: "",
  plan: plan8
)
task16.save!

# New Year Celebration with extended Family
task17 = Task.new(
  activity: "food and drinks for the potluck",
  completion: true,
  priority: 0,
  due_date: "",
  plan: plan9
)
task17.save!

# New Year Celebration with extended Family
task18 = Task.new(
  activity: "prepare a gift for my niece",
  completion: false,
  priority: 1,
  due_date: "",
  plan: plan9
)
task18.save!

puts 'Succesful creation of 18 tasks!'

puts 'create 22 subtasks...'


# Buy the tickets
Subtask.create!(
  activity: "Renew Passport before buy the tickets",
  completion: false,
  priority: 0,
  due_date: "",
  task: task1
)

# Buy the luggages
Subtask.create!(
  activity: "buy the luggage protector",
  completion: false,
  priority: 2,
  due_date: "",
  task: task2
)

# Buy the luggages
Subtask.create!(
  activity: "buy luggage tags",
  completion: true,
  priority: 2,
  due_date: "",
  task: task2
)

# Buy a host and domain
Subtask.create!(
  activity: "Domain and host price comparison",
  completion: false,
  priority: 1,
  due_date: "",
  task: task3
)

# Create a design
Subtask.create!(
  activity: "buy some pictures from unsplash +",
  completion: true,
  priority: 1,
  due_date: "",
  task: task4
)

# gather some inspiration
Subtask.create!(
  activity: "do some surveys for the thema",
  completion: false,
  priority: 1,
  due_date: "",
  task: task5
)

# buy some taskts
Subtask.create!(
  activity: "buy plant pots",
  completion: true,
  priority: 1,
  due_date: "",
  task: task6
)

# buy some taskts
Subtask.create!(
  activity: "buy shovels",
  completion: false,
  priority: 1,
  due_date: "",
  task: task6
)

# Make some space in the living room
Subtask.create!(
  activity: "do decluttering first",
  completion: false,
  priority: 0,
  due_date: "",
  task: task7
)

# make a schema of the content
Subtask.create!(
  activity: "find some inspirations",
  completion: false,
  priority: 1,
  due_date: "",
  task: task8
)

# Set a meeting with some folks to interview
Subtask.create!(
  activity: "cancel my meeting with friends",
  completion: false,
  priority: 0,
  due_date: "",
  task: task9
)

# Rent a place in the wood to write during the holidays
Subtask.create!(
  activity: "find a website for the rental",
  completion: false,
  priority: 1,
  due_date: "",
  task: task10
)

# Buy a formal party gown
Subtask.create!(
  activity: "buy a strapless bra",
  completion: true,
  priority: 1,
  due_date: "",
  task: task11
)

# Buy a formal party gown
Subtask.create!(
  activity: "buy a matching clutch",
  completion: false,
  priority: 2,
  due_date: "",
  task: task11
)

# Buy a wedding gift for Joe
Subtask.create!(
  activity: "ask Johnson for the idea",
  completion: false,
  priority: 2,
  due_date: "",
  task: task12
)

# Pass the interview and quiz
Subtask.create!(
  activity: "watch interview tutorial from youtube",
  completion: true,
  priority: 1,
  due_date: "",
  task: task13
)

# Preparation and study for the quiz
Subtask.create!(
  activity: "pay Udacity",
  completion: false,
  priority: 0,
  due_date: "",
  task: task14
)

# Preparation and study for the quiz
Subtask.create!(
  activity: "pay Codecademy",
  completion: false,
  priority: 1,
  due_date: "",
  task: task14
)

# Buy a gift for the gift exchange
Subtask.create!(
  activity: "buy a Christmas card",
  completion: true,
  priority: 1,
  due_date: "",
  task: task15
)


# Buy a Christmas Sweater
Subtask.create!(
  activity: "buy a matching shawl",
  completion: true,
  priority: 1,
  due_date: "",
  task: task16
)

# food and drinks for the potluck
Subtask.create!(
  activity: "buy turkey and sausages",
  completion: true,
  priority: 0,
  due_date: "",
  task: task17
)

# prepare a gift for my niece
Subtask.create!(
  activity: "buy a gift wrapper",
  completion: false,
  priority: 0,
  due_date: "",
  task: task18
)

puts 'Succesful creation of 22 subtasks!'
