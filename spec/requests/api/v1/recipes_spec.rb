require 'rails_helper'

RSpec.describe "Api::V1::Recipes", type: :request do
  describe "GET /index" do
    it 'can return a list of recipes in each country', :vcr do
      request_params = { country: "Canada"}
      
      get api_v1_recipes_path, params: request_params

      expect(response).to be_successful

      json_data = JSON.parse(response.body, symbolize_names: true)
      expect(json_data).to be_a Hash
    
      expect(json_data).to have_key(:data)
      expect(json_data[:data]).to be_an(Array)

      json_data[:data].each do |data|
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to be_a(String)
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to have_key(:title)
        expect(data[:attributes][:title]).to be_a(String)
        expect(data[:attributes]).to have_key(:url)
        expect(data[:attributes][:url]).to be_a(String)
        expect(data[:attributes]).to have_key(:country)
        expect(data[:attributes][:country]).to be_a(String)
        expect(data[:attributes]).to have_key(:image)
        expect(data[:attributes][:image]).to be_a(String)
      end
    end

    it 'will return a empty data array if no country is passed', :vcr do
      request_params = { country: ""}
      
      get api_v1_recipes_path, params: request_params

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_a Hash

      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data]).to eq([])
    end
  end
end
