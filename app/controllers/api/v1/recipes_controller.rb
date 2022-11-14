class Api::V1::RecipesController < ApplicationController

 def index
  country = RestFacade.country_details
  recipe_data = EdamamFacade.recipe_details(params[:country])
  
  render json: RecipeSerializer.new(recipe_data)

  random_country = RestFacade.random_country
 end
end
