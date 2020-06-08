class DistanceService

  def duration(origin, destination)
    trip = Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |f|
      f.params['origin'] = origin
      f.params['destination'] = destination
      f.params['key'] = ENV['COORDS_KEY']
    end
    json = JSON.parse(trip.body, symbolize_names: true)
    json[:routes].first[:legs].first[:duration][:text]
  end

end
