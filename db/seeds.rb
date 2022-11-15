# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: 'Ally Mo', email: 'moballyally@guhmail.com', api_key: '195393b70f5b8934fafa35567e82e3')
user2 = User.create!(name: 'Ray Charles', email: 'raybay@guhmail.com', api_key: 'b0f173cfcd82d583f77cf07208ef9b')

favorite1 = user.favorites.create!(country: 'Thailand', recipe_link: "https://food52.com/recipes/37220-thai-coconut-cremes", recipe_title: "THAI COCONUT CREMES" )
favorite2 = user.favorites.create!(country: 'France', recipe_link: "http://www.food52.com/recipes/351_herb_and_white_wine_granita", recipe_title: "Herb And White Wine Granita")
favorite3 = user2.favorites.create!(country: 'Germany', recipe_link: "https://www.foodnetwork.com/recipes/food-network-kitchen/cinnamon-stars-zimtsterne-germany-recipe-2009033", recipe_title: "Cinnamon Stars: Zimtsterne (Germany)")