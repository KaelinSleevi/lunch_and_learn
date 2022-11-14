require "rails_helper"


RSpec.describe RestFacade do
  it "can return a list of countries by name" do
   VCR.use_cassette('country_details') do
    countries = RestFacade.country_details
   
    expect(countries).to be_a(Array)
    expect(countries[1]).to eq("Aruba")
   end
  end

  it "can return a random country by name" do
   VCR.use_cassette('random_country') do
    country = RestFacade.random_country
   
    expect(country).to be_a(String)
   end
  end
end