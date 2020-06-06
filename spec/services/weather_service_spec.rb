require 'rails_helper'

describe WeatherService do
  context "instance methods" do
    context "#weather" do
      it "returns weather for location" do
        service = WeatherService.new
        search = service.weather(({:lat=>35.5950581, :lng=>-82.5514869}))
        require "pry"; binding.pry
        expect(search).to be_a Hash
      end
    end
  end
end
