class RestFacade

 def self.country_details
  country_data = RestService.get_country
  countries = country_data.map do |country|
   country[:name][:common]
  end
 end
end