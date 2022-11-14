require 'rails_helper'

RSpec.describe "Api::V1::TouristSights", type: :request do
  describe "GET /index" do
    it 'can return a list of tourist sights in each country', :vcr do
      request_params = {lat: "2.33", lon: "48.87"}
      
      get api_v1_tourist_sights_path, params: request_params

      expect(response).to be_successful

      place = JSON.parse(response.body, symbolize_names: true)
      expect(place).to be_a(Hash)
    end
  end
end
