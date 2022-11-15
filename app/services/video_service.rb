require 'faraday'
require 'json'

class VideoService
 def self.conn
  Faraday.new("https://youtube.googleapis.com") do |faraday|
   faraday.params["key"] = ENV["key"]
   faraday.params["part"] = "snippet"
   faraday.params["channelId"] = "UCluQ5yInbeAkkeCndNnUhpw"
  end
 end

 def self.get_videos(country)
  response = conn.get('/youtube/v3/search') do |request|
   request.params['q'] = country
  end
  JSON.parse(response.body, symbolize_names: true)
 end
end