require 'rails_helper'

describe "Weather information" do
  it "can send image of city weather" do
    get '/api/v1/background?location=denver, co'
    expect(response).to be_successful
    image = JSON.parse(response.body)
    expect(image.is_a? Hash).to eq(true)
    expect(image["data"]["attributes"].has_key?("image")).to eq(true)
    expect(image["data"]["attributes"].has_key?("city")).to eq(true)
  end

  it "can get weather data for a location" do
    get '/api/v1/forecast?location=denver, co'
    expect(response).to be_successful
    weather = JSON.parse(response.body)
    expect(weather.is_a? Hash).to eq(true)
    expect(weather["data"]["attributes"].has_key?("daily")).to eq(true)
    expect(weather["data"]["attributes"].has_key?("current")).to eq(true)
    expect(weather["data"]["attributes"].has_key?("hourly")).to eq(true)
    expect(weather["data"]["attributes"].has_key?("today")).to eq(true)
    require "pry"; binding.pry

  end
end
