class WeatherService

  def weather(coordinates)
    JSON.parse(conn(coordinates).body, symbolize_names: true)
  end

private

  def conn(coordinates)
    Faraday.get("https://api.openweathermap.org/data/2.5/onecall") do |f|
      f.params['lat'] = coordinates[:lat]
      f.params['lon'] = coordinates[:lng]
      f.params['exclude'] = 'minutely'
      f.params['appid'] = ENV['WEATHER_KEY']
      f.params['units'] = 'imperial'
    end
  end
end
