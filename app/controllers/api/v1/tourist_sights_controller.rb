class Api::V1::TouristSightsController < ApplicationController

 def index
  country = RestFacade.get_country_lat_long(params[:country])
  @places = PlaceFacade.tourism_details(country[1], country[0])

  render json: PlaceSerializer.new(@places)
 end
end