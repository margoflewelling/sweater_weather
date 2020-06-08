class Api::V1::FoodieController < ApplicationController

  def show
    foodie = SearchResults.new.food(params["start"], params["end"], params["search"])
    render json: FoodieSerializer.new(foodie).serialized_json
      end

end
