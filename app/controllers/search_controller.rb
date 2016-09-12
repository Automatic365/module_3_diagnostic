class SearchController < ApplicationController

  def index
    @connection        = Faraday.new('https://developer.nrel.gov')
    @connection.headers["X-Api-Key"] = ENV["NREL_API_KEY"]

    @stations = 
  end


end
