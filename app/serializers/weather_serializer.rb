class WeatherSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer
  attributes :daily, :current, :hourly, :today 
end
