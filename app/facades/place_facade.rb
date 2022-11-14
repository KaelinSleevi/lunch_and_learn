class PlaceFacade

 def self.tourism_details(lon, lat)
  toruism_data = PlaceService.get_tourism(lon, lat)[:features]
  tourist = toruism_data.map do |tour_data|
   Tour.new(tour_data)
  end
 end
end