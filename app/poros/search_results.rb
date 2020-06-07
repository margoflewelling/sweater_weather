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
    trip = Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |f|
      f.params['origin'] = origin
      f.params['destination'] = destination
      f.params['key'] = ENV['COORDS_KEY']
    end
    json = JSON.parse(trip.body, symbolize_names: true)
    duration = json[:routes].first[:legs].first[:duration][:text]
    destination_weather = weather(destination).current.slice(:temp, :weather)
    Roadtrip.new(user, origin, destination, duration, destination_weather)
  end

end
