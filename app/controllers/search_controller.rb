class SearchController < ApplicationController

  def symbol_search
    results = Net::HTTP.get('chstocksearch.herokuapp.com', "/api/#{params[:query]}")
    render json: results
  end

end
