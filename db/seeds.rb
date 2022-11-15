# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: 'Ally Mo', email: 'moballyally@guhmail.com', api_key: '195393b70f5b8934fafa35567e82e3')
user2 = User.create!(name: 'Ray Charles', email: 'raybay@guhmail.com', api_key: 'b0f173cfcd82d583f77cf07208ef9b')