class PhotoFacade
 
 def self.photo_details(country)
  photo_data = PhotoService.get_photos(country)
  photo_data[:results].map do |data|
   Photo.new(data, country)
  end  
 end
end