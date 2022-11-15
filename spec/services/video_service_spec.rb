require "rails_helper"

RSpec.describe VideoService do
 it "can return a list of countries" do
  VCR.use_cassette('get_videos') do
   videos = VideoService.get_videos("Thailand")

   expect(videos).to be_a(Hash)

   videos[:items].each do |video|
    expect(video).to have_key(:snippet)
    expect(video[:snippet]).to be_a(Hash)
    expect(video[:snippet]).to have_key(:title)
    expect(video[:snippet][:title]).to be_a(String)
    expect(video).to have_key(:id)
    expect(video[:id]).to be_a(Hash)
    expect(video[:id]).to have_key(:videoId)
    expect(video[:id][:videoId]).to be_a(String)
   end
  end
 end
end