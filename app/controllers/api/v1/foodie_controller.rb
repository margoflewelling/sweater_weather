class Api::V1::FoodieController < ApplicationController

  def show
    destination = params["end"]
    start = params["start"]
    geocoordinates = GeocoordinatesService.new.coordinates(params["end"])
        food = Faraday.get('https://developers.zomato.com/api/v2.1/search') do |f|
            f.headers['user-key'] = ENV['FOOD_KEY']
            f.params['lat'] = geocoordinates[:lat]
            f.params['lon'] = geocoordinates[:lng]
            f.params['q'] = params["search"]
            f.params['count'] = 1
          end
    json = JSON.parse(food.body, symbolize_names: true)
    restaurant_name = json[:restaurants].first[:restaurant][:name]
    restaurant_address = json[:restaurants].first[:restaurant][:location][:address]
    distance = DistanceService.new.duration(params["start"], params["end"])
    weather_info = WeatherService.new.weather(geocoordinates)
    temperature = weather_info[:current][:temp].round
    summary = weather_info[:current][:weather].first[:main]
    require "pry"; binding.pry
  end

end
