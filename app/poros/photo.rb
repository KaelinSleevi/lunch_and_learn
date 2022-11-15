class Photo
  attr_reader :alt_tag,
              :url,
              :country

  def initialize(data, country)
    @country = country
    @alt_tag = data[:alt_description]
    @url = data[:urls][:raw]
  end
end