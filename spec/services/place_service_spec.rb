require "rails_helper"


RSpec.describe PlaceService do
 it "can return a list of countries" do
  VCR.use_cassette('get_tourism') do
   lon = 2.33
   lat = 48.87
   places = PlaceService.get_tourism(lon, lat)

   expect(places).to be_a(Hash)
   expect(places).to have_key(:features)
   expect(places[:features]).to be_a(Array)
  end
 end
end