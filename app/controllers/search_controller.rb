class SearchController < ApplicationController

  def index
    @stations = Station.search_locations_by_zipcode(params)
  end

end
