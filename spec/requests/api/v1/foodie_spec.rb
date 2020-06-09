require 'rails_helper'

describe "Foodie" do
  it "can retrieve end city, traveltime, address/name of restaurant and forecast" do
    get '/api/v1/foodie?start=denver,co&end=asheville,nc&search=taco'
    expect(response).to be_successful
    foodie = JSON.parse(response.body)
    expect(foodie.is_a? Hash).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("end_location")).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("travel_time")).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("forecast")).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("restaurant")).to eq(true)
    expect(foodie["data"]["attributes"]["end_location"]).to eq("Asheville,Nc")
    expect(foodie["data"]["attributes"]["travel_time"]).to eq("21 hours 19 mins")
    expect(foodie["data"]["attributes"]["forecast"].has_key?("summary")).to eq(true)
    expect(foodie["data"]["attributes"]["forecast"].has_key?("temperature")).to eq(true)
    expect(foodie["data"]["attributes"]["restaurant"].has_key?("name")).to eq(true)
    expect(foodie["data"]["attributes"]["restaurant"].has_key?("address")).to eq(true)

## test 2
    get '/api/v1/foodie?start=denver,co&end=steamboat springs,co&search=burger'
    expect(response).to be_successful
    foodie = JSON.parse(response.body)
    expect(foodie.is_a? Hash).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("end_location")).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("travel_time")).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("forecast")).to eq(true)
    expect(foodie["data"]["attributes"].has_key?("restaurant")).to eq(true)
    expect(foodie["data"]["attributes"]["end_location"]).to eq("Steamboat Springs,Co")
    expect(foodie["data"]["attributes"]["forecast"].has_key?("summary")).to eq(true)
    expect(foodie["data"]["attributes"]["forecast"].has_key?("temperature")).to eq(true)
    expect(foodie["data"]["attributes"]["restaurant"].has_key?("name")).to eq(true)
    expect(foodie["data"]["attributes"]["restaurant"].has_key?("address")).to eq(true)
  end

  it "can fail gracely if no restaurant results are found" do
    get '/api/v1/foodie?start=denver,co&end=clark,co&search=indian'
    expect(response).to be_successful
    foodie = JSON.parse(response.body)
    expect(foodie.is_a? Hash).to eq(true)
    expect(foodie["data"]["attributes"]["restaurant"]).to eq("No Restaurants Found Matching Your Search")
  end
end
