require 'faraday'
require 'json'

class PhotoService
 def self.conn
  Faraday.new("https://api.unsplash.com") do |faraday|
   faraday.params["page"] = "1"
   faraday.params["client_id"] = ENV["access_key"]
  end
 end

 def self.get_photos(country)
  response = conn.get('/search/photos') do |request|
   request.params['query'] = country
  end
  JSON.parse(response.body, symbolize_names: true)
 end
end