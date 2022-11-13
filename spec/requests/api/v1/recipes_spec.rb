require 'rails_helper'

RSpec.describe "Api::V1::Recipes", type: :request do
  describe "GET /index" do
    it 'can return a list of recipes in each country', :vcr do
      request_params = { country: "Canada"}
      
      get api_v1_recipes_path, params: request_params

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_an Hash
    end
  end
end
