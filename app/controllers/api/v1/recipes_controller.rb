class Api::V1::RecipesController < ApplicationController

 def index
  response1 = Faraday.get("https://restcountries.com/v3.1/name/colombia")
  response2 = Faraday.get("https://api.edamam.com/api/recipes/v2?app_id=04cd2a2c&app_key=de7a5bf1bf2f6d78d80808f9526bc7a1&q=Thailand&type=public")
  @recipes = JSON.parse(response.body, symbolize_names: true)
 end
end
