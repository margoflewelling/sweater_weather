class Foodie
  attr_reader :end_location, :restaurant, :id, :travel_time, :forecast

  def initialize(destination, restaurant, travel_time, forecast)
    @id = 'null'
    @end_location = destination.titleize
    @restaurant = restaurant
    @travel_time = travel_time
    @forecast = forecast
  end

end
