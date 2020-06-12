class SearchResults

  def weather(location)
    weather_json = WeatherService.new.weather(geocoordinates(location))
    Weather.new(weather_json)
  end

  def image(location)
    img = PhotoService.new.photo(location)
    Photo.new(location, img)
  end

  def trip(origin, destination, user)
    duration = duration(origin, destination)
    destination_weather = weather(destination).forecast
    Roadtrip.new(user, origin, destination, duration, destination_weather)
  end

  def food(origin, destination, search)
    Foodie.new( destination,
                restaurant(search, destination),
                duration(origin, destination),
                weather(destination).forecast )
  end

private

  def restaurant(search, destination)
    RestaurantService.new.restaurant(search, geocoordinates(destination))
  end

  def duration(origin, destination)
    DistanceService.new.duration(origin, destination)
  end

  def geocoordinates(location)
    GeocoordinatesService.new.coordinates(location)
  end

end
