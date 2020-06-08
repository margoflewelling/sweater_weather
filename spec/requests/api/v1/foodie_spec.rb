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
    expect(foodie["data"]["attributes"]["end_location"]).to eq("pueblo, co")
    expect(foodie["data"]["attributes"]["travel_time"]).to eq("1 hours 48 min")
    expect(foodie["data"]["attributes"]["forecast"].has_key?("summary")).to eq(true)
    expect(foodie["data"]["attributes"]["forecast"].has_key?("temperature")).to eq(true)
    expect(foodie["data"]["attributes"]["restaurant"].has_key?("name")).to eq(true)
    expect(foodie["data"]["attributes"]["restaurant"].has_key?("address")).to eq(true)

  end
end



# {
#   "data": {
#     "id": "null",
#     "type": "foodie",
#     "attributes": {
#       "end_location": "pueblo,co",
#       "travel_time": "1 hours 48 min",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "restaurant": {
#         "name": "Angelo's Pizza Parlor",
#         "address": "105 E Riverwalk, Pueblo 81003"
#       }
#     }
#   }



# GET /api/v1/foodie?start=denver,co&end=pueblo,co&search=italian`
# ​
# Your API will return:
# - the end city
# - estimated travel time
# - the name and address of a restaurant that matches the search parameter
# - the forecast at your time of arrival
