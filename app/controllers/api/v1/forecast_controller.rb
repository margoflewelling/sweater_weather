class Api::V1::ForecastController < ApplicationController

  def show
    location = params["location"]
    weather_info = SearchResults.new.weather(location)
    render json: WeatherSerializer.new(weather_info).serialized_json
  end


end
