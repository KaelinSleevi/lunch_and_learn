require "rails_helper"


RSpec.describe EdamamService do
 it "can return a list of recipes per country", :vcr do
   recipes = EdamamService.recipe_search("China")

   expect(recipes).to be_a(Array)
   expect(recipes[1]).to have_key(:recipe)
   expect(recipes[1][:recipe]).to be_a(Hash)
 end
end