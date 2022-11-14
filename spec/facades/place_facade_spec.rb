require "rails_helper"


RSpec.describe EdamamFacade do
 it "can return a list of recipes by country" do
  VCR.use_cassette('tourism_search') do
   places = EdamamFacade.tourism_details("")
  
   expect(places).to be_a(Hash)
   expect(places).to eq("")
  end
 end
end