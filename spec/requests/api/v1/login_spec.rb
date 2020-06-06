require 'rails_helper'

describe "Logging in" do
  it "valid user can log in" do
    User.create!(email: 'margo@example.com', password: "123", password_confirmation: "123")
    user_info = {
                "email": "margo@example.com",
                "password": "123",
                }

    post '/api/v1/sessions', params: user_info.to_json, as: :json
    expect(response).to be_successful
    user = JSON.parse(response.body)
    expect(user.is_a? Hash).to eq(true)
    expect(user["data"]["attributes"].has_key?("email")).to eq(true)
    expect(user["data"]["attributes"].has_key?("api_key")).to eq(true)
  end
end
