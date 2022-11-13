require 'rails_helper'

RSpec.describe "Api::V1::Recipes", type: :request do
  describe "GET /index" do
    it 'can return a list of recipes in each country' do
      get api_v1_recipes_path
      
    end
  end
end
