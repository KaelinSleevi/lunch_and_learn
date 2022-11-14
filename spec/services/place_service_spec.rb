require "rails_helper"


RSpec.describe PlaceService do
 it "can return a list of countries" do
  VCR.use_cassette('get_tourism') do
   places = PlaceService.get_tourism

   expect(places).to be_a(Array)
   expect(places[1]).to have_key(:data)
   expect(places[1][:data]).to be_a(Hash)
  end
 end
end