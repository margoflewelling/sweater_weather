require 'rails_helper'

describe "Registration" do
  it "can register a user" do

    body = "{\"email\":\"whatever@example.com\,\"password\":\"password\",\"password_confirmation\":\"password\"}"
    user = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/users', params: user.to_json, as: :json
    expect(response).to be_successful
    user = JSON.parse(response.body)
    expect(user.is_a? Hash).to eq(true)
    expect(user["data"]["attributes"].has_key?("email")).to eq(true)
    expect(user["data"]["attributes"].has_key?("api_key")).to eq(true)
  end

end
