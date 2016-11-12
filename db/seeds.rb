# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Hoang Nhat",
             email: "hoangnhat@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             role: 1)
User.create!(name: "Hoang Nhat 1",
             email: "hoangnhat1@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             role: 1)
User.create!(name: "Hoang Nhat 2",
             email: "hoangnhat2@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             role: 1)


