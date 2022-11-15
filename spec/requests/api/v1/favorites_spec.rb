require 'rails_helper'

RSpec.describe "Api::V1::Favorites", type: :request do
  describe "GET /create" do
    it 'can register a favorite recipe for a user' do
      user = User.create!(name: 'Ally Mo', email: 'moballyally@guhmail.com', api_key: '195393b70f5b8934fafa35567e82e3')

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
end