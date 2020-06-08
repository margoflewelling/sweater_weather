class SearchResults

  def weather(location)
    coordinates = GeocoordinatesService.new.coordinates(location)
    weather_json = WeatherService.new.weather(coordinates)
    weather_info = Weather.new(weather_json)
  end

  def image(location)
    img = PhotoService.new.photo(location)
    photo = Photo.new(location, img)
  end

  def trip(origin, destination, user)
    duration = DistanceService.new.duration(origin, destination)
    destination_weather = weather(destination).current.slice(:temp, :weather)
    Roadtrip.new(user, origin, destination, duration, destination_weather)
  end

  def food(origin, destination, search)
    coordinates = GeocoordinatesService.new.coordinates(destination)
    restaurant = RestaurantService.new.restaurant(search, coordinates)
    travel_time = DistanceService.new.duration(origin, destination)
    forecast = weather(destination).forecast
    Foodie.new(destination, restaurant, travel_time, forecast)
  end

end
