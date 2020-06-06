require 'rails_helper'

describe GeocoordinatesService do
  context "instance methods" do
    context "#coordinate" do
      it "returns lat/long for loation" do
        service = GeocoordinatesService.new
        search = service.coordinates("Asheville, NC")
        expect(search).to be_a Hash
        expect(search.has_key?(:lat)).to eq(true)
        expect(search.has_key?(:lng)).to eq(true)
      end
    end
  end
end
