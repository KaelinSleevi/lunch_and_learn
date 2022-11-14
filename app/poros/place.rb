class Place
  attr_reader :type,
              :name,
              :address,
              :place_id

  def initialize(tour_data)
   @type = tour_data[:type]
   @name = tour_data[:properties][:name]
   @address = tour_data[:properties][:address_line2]
   @place_id = tour_data[:properties][:place_id]
  end
end