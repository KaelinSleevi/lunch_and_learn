require 'faraday'
require 'json'

class EdamamService
 def self.conn
  Faraday.new(url: 'https://api.edamam.com') do |faraday|
    faraday.params["appid"] = ENV["app_id"]
    faraday.params["appkey"] = ENV["app_key"]
  end
 end

 def self.recipe_search(q, type)
  response = conn.get("/api/recipes/v2?q=#{q}&type=#{type}")
  json = JSON.parse(response.body, symbolize_names: true)
 end
end