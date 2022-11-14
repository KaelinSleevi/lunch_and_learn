require 'rails_helper'

RSpec.describe "Api::V1::Places", type: :request do
  describe "GET /index" do
    it 'can return a list of tourist sights in each country', :vcr do
      request_params = { lon: "2.33", lat: "48.87"}
      
      get api_v1_places_path, params: request_params

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_an Hash
    end
  end
end
