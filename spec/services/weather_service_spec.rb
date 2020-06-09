require 'rails_helper'

describe WeatherService do
  context "instance methods" do
    context "#weather" do
      it "returns weather for location" do
        service = WeatherService.new
        search = service.weather(({:lat=>35.5950581, :lng=>-82.5514869}))
        expect(search).to be_a Hash
        expect(search.has_key?(:current)).to eq(true)
        expect(search.has_key?(:hourly)).to eq(true)
        expect(search.has_key?(:daily)).to eq(true)
      end
    end
  end
end
