class GeocoordinatesService

  def coordinates(location)
    conn = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.params['address'] = location
      f.params['key'] = ENV['COORDS_KEY']
    end
    json = JSON.parse(conn.body, symbolize_names: true)
    json[:results].first[:geometry][:location]
  end

end
