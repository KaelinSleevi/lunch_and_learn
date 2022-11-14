require "rails_helper"


RSpec.describe PlaceFacade do
 it "can return a list of recipes by country" do
  VCR.use_cassette('tourism_details') do
   lon = "2.33"
   lat = "48.87"
   places = PlaceFacade.tourism_details(lon, lat)

   places.each do |place|
    expect(place.name).to be_a(String)
    expect(place.address).to be_a(String)
    expect(place.place_id).to be_a(String)
   end
  end
 end
end