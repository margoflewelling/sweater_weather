class RestaurantService

  def restaurant(search, geocoordinates)
    json = JSON.parse(conn(search, geocoordinates).body, symbolize_names: true)
    { name: json[:restaurants].first[:restaurant][:name],
      address: json[:restaurants].first[:restaurant][:location][:address] }
  end

private

  def conn(search, geocoordinates)
    uri = 'https://developers.zomato.com/api/v2.1/search'
    Faraday.get(uri) do |f|
      f.headers['user-key'] = ENV['FOOD_KEY']
      f.params['lat'] = geocoordinates[:lat]
      f.params['lon'] = geocoordinates[:lng]
      f.params['q'] = search
      f.params['count'] = 1
    end
  end


end
