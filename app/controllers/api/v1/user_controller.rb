class Api::V1::UserController < ApplicationController

  def create
    user_info = JSON.parse(params["_json"], symbolize_names: true)
    user = User.create(user_info)
    render json: UserSerializer.new(user).serialized_json
  end

end
