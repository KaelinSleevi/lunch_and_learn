class Api::V1::TouristSightsController < ApplicationController

 def index
  country = RestFacade.country_details
  @places = PlaceFacade.tourism_details(params[:lon], params[:lat])

  render json: PlaceSerializer.new(@places)
 end
end