class Weather

def initialize(hash)
  @current = hash[:current]
  @hourly = hash[:hourly]
  @daily = hash[:daily]
  require "pry"; binding.pry
end


end
