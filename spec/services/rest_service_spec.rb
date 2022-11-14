require "rails_helper"


RSpec.describe RestService do
 it "can return a list of countries" do
  VCR.use_cassette('get_country') do
   countries = RestService.get_country

   expect(countries).to be_a(Array)
   expect(countries[1][:name]).to have_key(:common)
   expect(countries[1][:name][:common]).to be_a(String)
  end
 end
end