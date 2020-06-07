require 'rails_helper'

describe "Logging in" do
  it "valid user can log in" do
    User.create!(email: 'margo@example.com', password: "123", password_confirmation: "123")
    user_info = {
                "email": "margo@example.com",
                "password": "123",
                }

    post '/api/v1/sessions', params: user_info, as: :json
    expect(response).to be_successful
    user = JSON.parse(response.body)
    expect(user.is_a? Hash).to eq(true)
    expect(user["data"]["attributes"].has_key?("email")).to eq(true)
    expect(user["data"]["attributes"].has_key?("api_key")).to eq(true)
  end

  it "user can not login without correct credentials" do
    User.create!(email: 'margo@example.com', password: "123", password_confirmation: "123")
    user_info = {
                "email": "margo@example.com",
                "password": "12",
                }

    post '/api/v1/sessions', params: user_info, as: :json
    expect(response).to be_successful
    error = JSON.parse(response.body)
    expect(error["status"]).to eq("error")
    expect(error["code"]).to eq(400)
    expect(error["message"]).to eq("Incorrect password")
  end

end
