class Api::V1::LearningResourcesController < ApplicationController
 def index
  response = Faraday.get("https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&q=China&key=AIzaSyDdWt8K3a4Ilr5Qwc81U6fB_8CDJ2wyzUA")
  json = JSON.parse(response.body, symbolize_names: true)
 end
end