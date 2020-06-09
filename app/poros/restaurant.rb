class Restaurant
attr_reader :name, :address

def initialize(info_hash)
  @name = info_hash[:name]
  @address = info_hash[:address]
end

end
