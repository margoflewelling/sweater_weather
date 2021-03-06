class Weather
  attr_reader :id, :current, :today, :hourly, :daily

  def initialize(hash)
    @current = sanitize_current(hash[:current])
    @today = sanitize_today(hash[:daily].first)
    @hourly = (sanitize_hourly(hash[:hourly][0..7]))
    @daily = sanitize_daily(hash[:daily])
  end

  def forecast
    {temperature: @current[:temp].round,
     summary: @current[:weather].first[:main] }
  end

  def sanitize_current(current_full)
    current = current_full.slice(:temp, :feels_like, :humidity, :uvi, :weather)
    current[:time] = current_time(current_full[:dt])
    if current_full.key?(:visibility)
      current[:visibility] = current_full[:visibility]/1609
    else
      current[:visibility] = 'NA'
    end
    current
  end

  def sanitize_today(today)
    today[:temp] = today[:temp].slice(:day, :min, :max)
    today[:sunrise] = to_time(today[:sunrise])
    today[:sunset] = to_time(today[:sunset])
    today.slice(:sunrise, :sunset, :temp, :weather)
  end

  def sanitize_hourly(hourly)
    hourly.map do |hour|
      hour[:hour] = to_hours(hour[:dt])
      hour.slice(:hour, :temp, :weather)
    end
  end

  def sanitize_daily(daily)
    daily.map do |day|
      day[:day] = to_day(day[:dt])
      day[:temp] = day[:temp].slice(:min, :max)
      day.slice(:day, :temp, :weather, :rain)
    end
  end

  def to_hours(dt)
    time = Time.at(dt).to_datetime
    hour = time.strftime("%I %p")
    hour = hour[1..-1] if hour[0] == "0"
    hour
  end

  def to_time(dt)
    time = Time.at(dt).to_datetime
    hour = time.strftime("%I:%M %p")
    hour = hour[1..-1] if hour[0] == "0"
    hour
  end

  def to_day(dt)
    time = Time.at(dt).to_datetime
    time.strftime("%A")
  end

  def current_time(dt)
    time = Time.at(dt).to_datetime
    time.strftime("%I:%M %p, %b %d")
  end

end
