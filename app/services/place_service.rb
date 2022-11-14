class PlaceService
 def self.conn
  Faraday.new(url: 'https://api.geoapify.com') do |faraday|
    faraday.params["api_key"] = ENV["api_key"]
    faraday.params["categories"] = "tourism.sights"
  end
 end

 def self.get_tourism(lon, lat)
  response = conn.get("/v2/places?filter=circle:#{lon},#{lat},20000")
  JSON.parse(response.body, symbolize_names: true)
 end
end