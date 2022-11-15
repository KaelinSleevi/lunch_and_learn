class VideoFacade

 def self.video_details(country)
  video_data = VideoService.get_videos(country)
  video_data[:items].map do |data|
   Video.new(data, country)
  end  
 end
end