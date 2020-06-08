class Api::V1::FoodieController < ApplicationController

  def show
    require "pry"; binding.pry
    destination = params["end"]
    start = params["start"]
        food = Faraday.get('https://developers.zomato.com/api/v2.1/search') do |f|
            f.headers['user-key'] = ENV['FOOD_KEY']
            f.params['lat'] = 35.5951
            f.params['lon'] = -82.5515
            f.params['q'] = params["search"]
          end
  end

end
