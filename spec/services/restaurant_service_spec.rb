require 'rails_helper'

describe RestaurantService do
  context "instance methods" do
    context "#restaurant" do
      it "returns hash with name and address" do
        service = RestaurantService.new
        restaurant = service.restaurant("arepas", {lat: 39.7392, lng: -104.9903})
        expect(restaurant).to be_a Hash
      end

      it "returns message if no results found" do
        service = RestaurantService.new
        restaurant = service.restaurant("werfhws", {lat: 39.7392, lng: -104.9903})
        expect(restaurant). to eq("No Restaurants Found Matching Your Search")
      end
    end
  end
end
