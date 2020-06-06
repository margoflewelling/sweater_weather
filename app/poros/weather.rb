class Weather

  def initialize(hash)
    @current = sanitize_current(hash[:current])
    @today = sanitize_today(hash[:daily].first)
    @hourly = sanitize_hourly(hash[:hourly])
    @daily = sanitize_daily(hash[:daily])
  end

  def sanitize_current(current_full)
    current = current_full.slice(:temp, :feels_like, :humidity, :uvi, :weather)
    current[:temp] = (1.8*(current[:temp] - 273) + 32).round
    current[:feels_like] = (1.8*(current[:feels_like] - 273) + 32).round
  end

  def sanitize_today(today_full)
    today = today_full.slice(:sunrise, :sunset, :temp, :weather)
    today[:temp] = today[:temp].transform_values {|temp| (1.8*(temp - 273) + 32).round}
  end

  def sanitize_hourly(hourly)
    hourly.map do |hour|
      hour.slice(:dt, :temp, :weather)
    end
  end

  def sanitize_daily(daily)
    daily.map do |day|
      day.slice(:dt, :temp, :weather, :rain)
    end
  end

end
