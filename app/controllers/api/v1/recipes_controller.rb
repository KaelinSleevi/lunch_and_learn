class Api::V1::RecipesController < ApplicationController

 def index
  country = RestFacade.country_details
  random_country = RestFacade.random_country

  if country.present?
   recipe_data = EdamamFacade.recipe_details(params[:country])
   render json: RecipeSerializer.new(recipe_data)
  else
   random_recipe = EdamamFacade.recipe_details(random_country)
   render json: RecipeSerializer.new(random_recipe)
  end
 end
end
