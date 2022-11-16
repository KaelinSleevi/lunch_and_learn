require 'rails_helper'

RSpec.describe "Api::V1::Favorites", type: :request do
  describe "GET /create" do
    it 'can register a favorite recipe for a user' do
      user = User.create!(name: 'Sally Moo', email: 'mo0ballysally@guhmail.com', api_key: '195393b70f5b8934fafa35567e82e3')

      headers = { "CONTENT_TYPE" => "application/json" }

      favorite_params = {
         "api_key": "#{user.api_key}",
         "country": "thailand",
         "recipe_link": "https://food52.com/recipes/37220-thai-coconut-cremes",
         "recipe_title": "THAI COCONUT CREMES"
       }

      post api_v1_favorites_path, headers: headers, params: JSON.generate(favorite_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user_data = JSON.parse(response.body, symbolize_names: true)

    end
  end

  describe "GET /index" do
    it 'can get all favorite recipes for a user' do
      user = User.create!(name: 'Sally Mo0', email: 'mo0ballysally@guhmail.com', api_key: '195393b70f5b8934fafa35567e82e3')
      favorite1 = user.favorites.create!(country: 'Thailand', recipe_link: "https://food52.com/recipes/37220-thai-coconut-cremes", recipe_title: "THAI COCONUT CREMES" )
      favorite2 = user.favorites.create!(country: 'France', recipe_link: "http://www.food52.com/recipes/351_herb_and_white_wine_granita", recipe_title: "Herb And White Wine Granita")
      favorite3 = user.favorites.create!(country: 'Germany', recipe_link: "https://www.foodnetwork.com/recipes/food-network-kitchen/cinnamon-stars-zimtsterne-germany-recipe-2009033", recipe_title: "Cinnamon Stars: Zimtsterne (Germany)")

      request_params = { 'api_key': '195393b70f5b8934fafa35567e82e3' }
      get api_v1_favorites_path, params: request_params

      expect(response).to be_successful
      expect(response.status).to eq(200)

      user_data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end