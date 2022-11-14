require "rails_helper"


RSpec.describe EdamamFacade do
 it "can return a list of recipes by country" do
  VCR.use_cassette('recipe_search') do
   recipes = EdamamFacade.recipe_details("Thailand")
  
   expect(recipes).to be_a(Array)
   expect(recipes[1].title).to eq("THAI COCONUT CREMES")
  end
 end
end