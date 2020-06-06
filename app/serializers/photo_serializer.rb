class PhotoSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :city, :image
end
