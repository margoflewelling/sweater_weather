class Photo
  attr_reader :city, :image, :id

  def initialize(city, image)
    @city = city
    @image = image
  end

end
