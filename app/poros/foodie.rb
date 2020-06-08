class Foodie
  attr_reader :end_location, :restaurant, :id, :travel_time, :forecast

  def initialize(destination, restaurant, distance, forecast)
    @id = 'null'
    @end_location = destination.titleize
    @restaurant = restaurant
    @travel_time = distance
    @forecast = forecast
  end

end
