class RoadtripSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :user, :origin, :destination, :duration, :destination_weather
end
