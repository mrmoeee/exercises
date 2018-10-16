# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Question.destroy_all
# Poll.destroy_all
# Answer.destroy_all
# Response.destroy_all

ActiveRecord::Base.transaction do
  
  
  joonho = User.create!(username: 'Joonho')
  matt = User.create!(username: 'M4TT')
  dustin = User.create!(username: 'NERD')
  nataly = User.create!(username: 'Naaaat')
  
  poll1 = Poll.create!(poll_name: 'Colors', user_id: 1)
  poll2 = Poll.create!(poll_name: 'Food', user_id: 2)
  poll3 = Poll.create!(poll_name: 'Nerd Stuff', user_id: 3)
  poll4 = Poll.create!(poll_name: 'Bikes', user_id: 4)
  
  question1 = Question.create!(poll_id: 1, question_text: 'Whats your favorite color?')
  question2 = Question.create!(poll_id: 2, question_text: 'Whats your favorite food?')
  question3 = Question.create!(poll_id: 3, question_text: 'Whats your favorite nerd stuff?')
  question4 = Question.create!(poll_id: 4, question_text: "Where'd my bike go?")
  
  answer1 = Answer.create!(question_id: 1, answer_text: 'Blue')
  answer2 = Answer.create!(question_id: 1, answer_text: 'Black')
  answer3 = Answer.create!(question_id: 2, answer_text: 'Steak')
  answer4 = Answer.create!(question_id: 2, answer_text: 'Ban Mi' )
  answer5 = Answer.create!(question_id: 3, answer_text: 'Nerdy stuff' )
  answer6 = Answer.create!(question_id: 3, answer_text: 'Even more nerdy stuff')
  answer7 = Answer.create!(question_id: 4, answer_text: 'huffy')
  answer8 = Answer.create!(question_id: 4, answer_text: 'schwinn')
  
  response1 = Response.create!(user_id: 4, answer_id: 1)
  response2 = Response.create!(user_id: 3, answer_id: 4)
  response3 = Response.create!(user_id: 1, answer_id: 5)
  response4 = Response.create!(user_id: 2, answer_id: 7)
  response5 = Response.create!(user_id: 4, answer_id: 3)
  response6 = Response.create!(user_id: 3, answer_id: 2)
  response7 = Response.create!(user_id: 1, answer_id: 8)
  response8 = Response.create!(user_id: 2, answer_id: 6)
  
end