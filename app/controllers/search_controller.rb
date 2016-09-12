class SearchController < ApplicationController

  def index
    @stations = search_locations_by_zipcode
  end

  def search_locations_by_zipcode
    @connection        = Faraday.new("https://developer.nrel.gov")
    @connection.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
    response = @connection.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
      req.params['location'] = params[:zip]
    end
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
