class Api::V1::ForecastController < ApplicationController

  def show
    weather_info = SearchResults.new.weather(params["location"])
    render json: WeatherSerializer.new(weather_info).serialized_json
  end


end
