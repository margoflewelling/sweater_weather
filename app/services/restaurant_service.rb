class RestaurantService

  def restaurant(search, geocoordinates)
    food = Faraday.get('https://developers.zomato.com/api/v2.1/search') do |f|
        f.headers['user-key'] = ENV['FOOD_KEY']
        f.params['lat'] = geocoordinates[:lat]
        f.params['lon'] = geocoordinates[:lng]
        f.params['q'] = search
        f.params['count'] = 1
      end
    json = JSON.parse(food.body, symbolize_names: true)
    name = json[:restaurants].first[:restaurant][:name]
    address = json[:restaurants].first[:restaurant][:location][:address]
    restaurant = {name: name, address: address}
  end

end
