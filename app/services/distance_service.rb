class DistanceService

  def duration(origin, destination)
    json = JSON.parse(conn(origin, destination).body, symbolize_names: true)
    json[:routes].first[:legs].first[:duration][:text]
  end

private

  def conn(origin, destination)
    Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |f|
      f.params['origin'] = origin
      f.params['destination'] = destination
      f.params['key'] = ENV['COORDS_KEY']
    end
  end


end
