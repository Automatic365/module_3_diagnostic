class StationService

  def initialize
    @connection = Faraday.new("https://developer.nrel.gov")
    @connection.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
  end

  def search_locations_by_zipcode(parameters)
    response = @connection.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
      req.params['location'] = parameters[:q]
      req.params['limit'] = 10
    end
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
