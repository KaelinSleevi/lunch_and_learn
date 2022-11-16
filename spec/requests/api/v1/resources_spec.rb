require 'rails_helper'

RSpec.describe "Api::V1::Rescources", type: :request do
  describe "GET /index" do
    it 'can return a list of recipes in each country', :vcr do
      request_params = { country: "Canada"}
      
      get api_v1_learning_resources_path, params: request_params

      expect(response).to be_successful

      json_data = JSON.parse(response.body, symbolize_names: true)
      expect(json_data).to be_an Hash


      expect(json_data).to have_key(:data)
      expect(json_data[:data]).to be_a(Hash)
      expect(json_data[:data]).to have_key(:id)
      expect(json_data[:data][:id]).to eq(nil)
      expect(json_data[:data]).to have_key(:type)
      expect(json_data[:data][:type]).to be_a(String)
      expect(json_data[:data]).to have_key(:attributes)
    end

    it 'can return a hash with(an empty array)no images or videos if none are found', :vcr do
      request_params = { country: "Turkmenistan"}
      
      get api_v1_learning_resources_path, params: request_params

      expect(response).to be_successful

      json_data = JSON.parse(response.body, symbolize_names: true)
      expect(json_data).to be_an Hash

      expect(json_data).to have_key(:data)
      expect(json_data[:data]).to be_a(Hash)
      expect(json_data[:data]).to have_key(:id)
      expect(json_data[:data][:id]).to eq(nil)
      expect(json_data[:data]).to have_key(:type)
      expect(json_data[:data][:type]).to be_a(String)
      expect(json_data[:data]).to have_key(:attributes)
      expect(json_data[:data][:attributes]).to have_key(:video)
      expect(json_data[:data][:attributes][:video]).to be_an(Array)
      expect(json_data[:data][:attributes][:video]).to eq([])
      expect(json_data[:data][:attributes]).to have_key(:images)
      expect(json_data[:data][:attributes][:images]).to be_an(Array)
    end
  end
end
