class Api::V1::LearningResourcesController < ApplicationController
 def index
  country = count_params
  photos = PhotoFacade.photo_details(count_params)
  videos = VideoFacade.video_details(count_params)
  
  render json: LearningResourcesSerializer.resources(videos, photos, country)
 end

 private

 def count_params
  params.permit(:country)
 end
end