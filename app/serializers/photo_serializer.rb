class PhotoSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  cache key: 'photo', expires_in: 12.hours
  attributes :city, :image
end
