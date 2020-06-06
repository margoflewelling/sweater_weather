require 'rails_helper'

describe PhotoService do
  context "instance methods" do
    context "#photo" do
      it "returns location photo" do
        service = PhotoService.new
        search = service.photo("Asheville, NC")
        expect(search).to be_a String
      end
    end
  end
end
