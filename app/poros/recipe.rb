class Recipe
  attr_reader :title,
              :image, 
              :country, 
              :url

  def initialize(data, country)
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @image = data[:recipe][:image]
    @country = country.downcase
  end
end