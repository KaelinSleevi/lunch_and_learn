require 'faraday'
require 'json'

class RestService
 def self.conn
  Faraday.new("https://restcountries.com")
 end

 def self.get_country(name)
  response = conn.get("/v3.1/name/#{name}")
  json = JSON.parse(response.body, symbolize_names: true)
 end
end