require 'rails_helper'

 describe Photo do
   it "exists" do
     photo = Photo.new("Asheville, NC",
                       "https://upload.wikimedia.org/wikipedia/commons/0/0e/Asheville_at_dusk.jpg")
    expect(photo).to be_a Photo
    expect(photo.city).to eq("Asheville, NC")
    expect(photo.image).to eq("https://upload.wikimedia.org/wikipedia/commons/0/0e/Asheville_at_dusk.jpg")

   end
end
