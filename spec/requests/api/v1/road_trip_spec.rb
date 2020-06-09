require 'rails_helper'

  describe 'road trip endpoint' do
    it "can get road trip information back from a valid request" do
      margo = User.create!(email: 'margo@example.com', password: "123", password_confirmation: "123")
      trip = {
              "origin": "Denver,CO",
              "destination": "Bozeman, MT",
              "api_key": "#{margo.api_key}"
            }

      post '/api/v1/road_trip', params: trip.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response).to be_successful
      trip = JSON.parse(response.body)
      expect(trip).to be_a Hash
      expect(trip["data"]["attributes"].has_key?("origin")).to eq(true)
      expect(trip["data"]["attributes"].has_key?("destination")).to eq(true)
      expect(trip["data"]["attributes"].has_key?("duration")).to eq(true)
      expect(trip["data"]["attributes"].has_key?("destination_weather")).to eq(true)
    end

    it 'returns an error if request has an invalid api_key' do
      margo = User.create!(email: 'margo@example.com', password: "123", password_confirmation: "123")
      trip = {
              "origin": "Denver,CO",
              "destination": "Bozeman, MT",
              "api_key": "FJGUDUJ8937"
            }

      post '/api/v1/road_trip', params: trip.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response.status).to eq(401)
      trip = JSON.parse(response.body)
      expect(trip).to be_a Hash
      expect(trip["message"]).to eq("Unauthorized")
    end
  end
