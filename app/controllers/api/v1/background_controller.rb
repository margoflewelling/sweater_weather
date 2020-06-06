class Api::V1::BackgroundController < ApplicationController

  def show
    photo = SearchResults.new.image(params["location"])
    render json: PhotoSerializer.new(photo).serialized_json
  end

end
