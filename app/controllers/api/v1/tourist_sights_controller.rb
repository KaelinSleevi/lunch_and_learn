class Api::V1::TouristSightsController < ApplicationController

 def index
  response = Faraday.get('https://api.geoapify.com/v2/places?categories=tourism.sights&filter=circle:2.33,48.87,20000&apiKey=d7a0b6cff7eb42a0979803b632cfeb53')
  body = JSON.parse(response.body, symbolize_names: true)
 end
end