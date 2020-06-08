class Api::V1::RoadtripController < ApplicationController

  def create
    json = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by_api_key(json[:api_key])
    if user.nil?
      render :status => "401", json: {message: "Unauthorized"}
    else
      trip = SearchResults.new.trip(json[:origin], json[:destination], user)
      render json: RoadtripSerializer.new(trip).serialized_json
    end
  end

end
