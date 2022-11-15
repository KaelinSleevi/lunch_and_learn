class Video
  attr_reader :country,
              :title,
              :youtube_video_id

  def initialize(data, country)
   @country = country
   @title = data[:snippet][:title]
   @youtube_video_id = data[:id][:videoId]
  end
end