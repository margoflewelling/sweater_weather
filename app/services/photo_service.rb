class PhotoService

  def photo(location)
    city = location.split(',').first.downcase
    json = JSON.parse(conn(city).body, symbolize_names: true)
    if json[:status] == 404
      "No photo found for this location"
    else
      json[:photos].first[:image][:mobile]
    end 
  end

private

  def conn(city)
    Faraday.get("https://api.teleport.org/api/urban_areas/slug:#{city}/images/")
  end

end
