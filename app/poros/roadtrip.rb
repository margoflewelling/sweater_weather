class Roadtrip
  attr_reader :id, :user, :origin, :destination, :duration, :destination_weather

  def initialize(user, origin, destination, duration, destination_weather)
    @id = 1
    @user = user.email
    @origin = origin
    @destination = destination
    @duration = duration
    @destination_weather = destination_weather
  end

end
