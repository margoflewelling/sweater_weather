class Weather
  attr_reader :id, :current, :today, :hourly, :daily

  def initialize(hash)
    @id = 1
    @current = sanitize_current(hash[:current])
    @today = sanitize_today(hash[:daily].first)
    @hourly = (sanitize_hourly(hash[:hourly]))[0..8]
    @daily = sanitize_daily(hash[:daily])
  end

  def sanitize_current(current_full)
    current = current_full.slice(:temp, :feels_like, :humidity, :uvi, :weather)
    current
  end

  def sanitize_today(today)
    today[:temp] = today[:temp].slice(:day, :min, :max)
    today[:sunrise] = to_hours(today[:sunrise])
    today[:sunset] = to_hours(today[:sunset])
    today.slice(:sunrise, :sunset, :temp, :weather)
  end

  def sanitize_hourly(hourly)
    hourly.map do |hour|
      hour[:dt] = to_hours(hour[:dt])
      hour.slice(:dt, :temp, :weather)
    end
  end

  def sanitize_daily(daily)
    daily.map do |day|
      day[:dt] = to_day(day[:dt])
      day[:temp] = day[:temp].slice(:min, :max)
      day.slice(:dt, :temp, :weather, :rain)
    end
  end

  def to_hours(dt)
    time = Time.at(dt).to_datetime
    time.strftime("%I:%M %p")
  end

  def to_day(dt)
    time = Time.at(dt).to_datetime
    time.strftime("%A")
  end

end
