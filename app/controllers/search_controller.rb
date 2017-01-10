class SearchController < ApplicationController

  def symbol_search
    results = Net::HTTP.get('chstocksearch.herokuapp.com', "/api/#{params[:query]}")
    render json: results
  end

  def stock_search
    client = YahooFinance::Client.new
    current_data = client.quotes([params[:stock_symbol]], [:ask]).first
    render json: current_data.ask
  end

  def stock_history
    client = YahooFinance::Client.new
    data = client.historical_quotes(params[:stock_symbol],
                                    {start_date: 2.year.ago, end_date: Time.now}
                                    )
    render json: data
  end
end
