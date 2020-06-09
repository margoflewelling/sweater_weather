require 'rails_helper'

describe "Registration" do
  it "can register a user" do

    user = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/users', params: user.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
    expect(response).to be_successful
    user = JSON.parse(response.body)
    expect(user.is_a? Hash).to eq(true)
    expect(user["data"]["attributes"].has_key?("email")).to eq(true)
    expect(user["data"]["attributes"].has_key?("api_key")).to eq(true)
  end

  it "sends an error if user passwords don't match" do
    user = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "word"
            }

    post '/api/v1/users', params: user.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
    expect(response.status).to eq(400)
    error = JSON.parse(response.body)
    expect(error["message"]).to eq("Password confirmation doesn't match Password")
  end

  it "sends an error if user email is not unique" do
    user1 = User.create!(email: 'whatever@example.com', password: "123", password_confirmation: "123")
    user = {
            "email": "whatever@example.com",
            "password": "password",
            "password_confirmation": "password"
            }

    post '/api/v1/users', params: user.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
    expect(response.status).to eq(400)
    error = JSON.parse(response.body)
    expect(error["message"]).to eq("Email has already been taken")
  end

  it "sends an error if there are missing fields" do
    user = {
            "email": "whatever@example.com",
            "password": "password",
            }

    post '/api/v1/users', params: user.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
    expect(response.status).to eq(400)
    error = JSON.parse(response.body)
    expect(error["message"]).to eq("Password confirmation can't be blank")
  end


end
