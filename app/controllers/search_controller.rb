class SearchController < ApplicationController

  def index
    @connection        = Faraday.new('https://developer.nrel.gov')
    @connection.headers["X-Api-Key"] = ENV["NREL_API_KEY"]
    response = @connection.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
      req.params['location'] = params[:zip]
    end

    @stations = response.body
  end


end
