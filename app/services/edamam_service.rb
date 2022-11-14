require 'faraday'
require 'json'

class EdamamService
 def self.conn
  Faraday.new(url: 'https://api.edamam.com') do |faraday|
    faraday.params["app_id"] = ENV["app_id"]
    faraday.params["app_key"] = ENV["app_key"]
    faraday.params["type"] = "public"
  end
 end

 def self.recipe_search(country)
  response = conn.get("/api/recipes/v2") do |req|
    req.params['q'] = country
  end
  JSON.parse(response.body, symbolize_names: true)[:hits]
 end
end