class GeocoordinatesService

  def coordinates(location)
    json = JSON.parse(conn(location).body, symbolize_names: true)
    json[:results].first[:geometry][:location]
  end

private

  def conn(location)
    Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.params['address'] = location
      f.params['key'] = ENV['COORDS_KEY']
    end
  end

end
