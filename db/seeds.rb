# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
  User.create!(email: 'doc1@test.com', password: 'password1', password_confirmation: 'password1', role: 'doctor', gender: 'male',
               first_name: 'John', last_name: 'Doe', age: 45)
  User.create!(email: 'doc2@test.com', password: 'password1', password_confirmation: 'password1', role: 'doctor', 
               gender: 'female', first_name: 'Lisa', last_name: 'Jelena', age: 40)
  
  
  