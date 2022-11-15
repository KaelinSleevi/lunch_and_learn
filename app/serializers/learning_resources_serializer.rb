class LearningResourcesSerializer
 def self.resources(videos, photos, country)
   if country != nil
   {
    data: {
       id: nil,
       type: "learning_resource",
          attributes: {
           country: country,
           video:
            videos.map do |video|
            { title: video.title,
             youtube_video_id: video.youtube_video_id }
            end,
           images: 
            photos.map do |photo|
               { alt_tag: photo.alt_tag,
                 url: photo.url }
               end
          }
    }
   }
  else
     {
    data: {
        id: nil,
        type: "learning_resource",
        attributes: {
            country: country, 
            video: [],
            images: []
        }
    }
  }
  end
 end
end