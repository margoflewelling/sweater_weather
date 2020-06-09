require 'rails_helper'

 describe Roadtrip do
   it "exists" do
     user = User.new({email: "m@example.com", password: "123", password_confirmation: "123"})
     trip = Roadtrip.new(user, "Atlanta, GA", "Asheville, NC", "4 hours 3 mins", {temperature: 70, summary: "Sunny"})
    expect(trip).to be_a Roadtrip
    expect(trip.destination).to eq("Asheville, NC")
    expect(trip.user).to eq("m@example.com")
    expect(trip.duration).to eq("4 hours 3 mins")
    expect(trip.origin).to eq("Atlanta, GA")

   end
end
