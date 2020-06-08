require 'rails_helper'

describe 'distance service' do
  it "can get duration of trip between two places" do
    service = DistanceService.new
    duration = service.duration("Leavenworth, WA", "Seattle, WA")
    expect(duration).to be_a String
    expect(duration.include?("hours")).to eq(true)
  end
end
