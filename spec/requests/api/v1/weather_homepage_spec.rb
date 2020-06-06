require 'rails_helper'

describe "Weather information" do
  xit "can send image of city weather" do
    get '/api/v1/background?location=denver, co'
    expect(response).to be_successful
    image = JSON.parse(response.body)
  end

  it "can get weather data for a location" do
    get '/api/v1/forecast?location=denver, co'
    expect(response).to be_successful
    

  end
end
