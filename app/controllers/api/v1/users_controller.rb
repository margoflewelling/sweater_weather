class Api::V1::UsersController < ApplicationController

  def create
    user_info = JSON.parse(params["_json"], symbolize_names: true)
    user = User.create(user_info)
    if user.save
      render json: UserSerializer.new(user).serialized_json
    else
      message = user.errors.full_messages.to_sentence
      render json: {status: "error", code: 400, message: message}
    end
  end

end
