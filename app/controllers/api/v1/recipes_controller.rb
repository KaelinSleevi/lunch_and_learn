class Api::V1::RecipesController < ApplicationController

 def index
  require "pry"; binding.pry
  country = RestFacade.country_details
  recipe_data = EdamamFacade.recipe_details(country)
 end
end
