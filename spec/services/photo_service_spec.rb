require "rails_helper"

RSpec.describe PhotoService do
 it "can return a list of countries" do
  VCR.use_cassette('get_photos') do
   photos = PhotoService.get_photos("Thailand")
 
   expect(photos).to be_a(Hash)
   
   photos[:results].each do |photo|
    expect(photo).to have_key(:alt_description)
    expect(photo[:alt_description]).to be_a(String)
    expect(photo).to have_key(:urls)
    expect(photo[:urls]).to have_key(:raw)
    expect(photo[:urls][:raw]).to be_a(String)
   end
  end
 end
end