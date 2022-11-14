class RestFacade

 def self.country_details
  country_data = RestService.get_country
  countries = country_data.map do |country|
   country[:name][:common]
  end
 end

 def self.random_country
  country = country_details
  country.shuffle.first
 end
end