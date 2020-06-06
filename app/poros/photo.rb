class Photo
  attr_reader :city, :image, :id

  def initialize(city, image)
    @id = 0
    @city = city
    @image = image
  end

end
