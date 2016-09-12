class Station < OpenStruct

  def self.service
    StationService.new
  end

  def self.search_locations_by_zipcode(params)
    raw_stations = service.search_locations_by_zipcode(params)
    raw_stations["fuel_stations"].map do |raw_station|
      Station.new(raw_station)
    end
  end
end
