class SearchResults

  def weather(location)
    coordinates = geocoordinates(location)
    weather_json = WeatherService.new.weather(coordinates)
    weather_info = Weather.new(weather_json)
  end

  def image(location)
    img = PhotoService.new.photo(location)
    photo = Photo.new(location, img)
  end

  def trip(origin, destination, user)
    duration = duration(origin, destination)
    destination_weather = weather(destination).forecast
    Roadtrip.new(user, origin, destination, duration, destination_weather)
  end

  def food(origin, destination, search)
    restaurant = RestaurantService.new.restaurant(search, geocoordinates(destination))
    Foodie.new( destination,
                restaurant,
                duration(origin, destination),
                weather(destination).forecast )
  end

private

  def duration(origin, destination)
    DistanceService.new.duration(origin, destination)
  end

  def geocoordinates(location)
    GeocoordinatesService.new.coordinates(location)
  end

end
