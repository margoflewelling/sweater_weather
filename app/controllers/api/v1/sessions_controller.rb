class Api::V1::SessionsController < ApplicationController

  def new
    user_info = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(email: user_info[:email])
    if user.authenticate(user_info[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user).serialized_json
    else
      render json: {status: "error", code: 400, message: "Incorrect password"}
    end
  end

end
