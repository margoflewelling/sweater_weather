class PhotoService

  def photo(location)
    city = location.split(',').first.downcase
    conn = Faraday.get("https://api.teleport.org/api/urban_areas/slug:#{city}/images/")
    json = JSON.parse(conn.body, symbolize_names: true)
    json[:photos].first[:image][:mobile]
  end

end
