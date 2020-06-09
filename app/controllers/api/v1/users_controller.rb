class Api::V1::UsersController < ApplicationController

  def create
    user_info = JSON.parse(request.body.read, symbolize_names: true)
    user = User.create(user_info)
    if user.save
      render :status => :created, json: UserSerializer.new(user).serialized_json
    else
      message = user.errors.full_messages.to_sentence
      render :status => "400", json: {message: message}
    end
  end

end
