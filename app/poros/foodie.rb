class Foodie
  attr_reader :end_location, :restaurant, :id, :travel_time, :forecast

  def initialize(destination, restaurant, distance, forecast)
    @id = 1
    @end_location = destination.titleize
    @restaurant = restaurant
    @travel_time = distance
    @forecast = forecast
  end

end
