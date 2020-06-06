class SearchResults

  def weather(location)
    coordinates = GeocoordinatesService.new.coordinates(location)
    weather_json = WeatherService.new.weather(coordinates)
    weather_info = Weather.new(weather_json)
  end

end
