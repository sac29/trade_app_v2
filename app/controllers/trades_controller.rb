class TradesController < ApplicationController
  protect_from_forgery with: :exception
  def index
    if session.key?(:user)
      @my_trades = Trades.where(user_id: session[:user]['id']).order(action_date: :desc)
    else
      redirect_to '/'
    end
  end

  def add
    if session.key?(:user)
      company = params[:company]
      stock_price = params[:price]
      stocks = params[:shares]
      trade_type = params[:trade]
      user = session[:user]['id']
      date = params[:action_date]
      trade = Trades.new(company_name: company, stock_price: stock_price, no_of_stocks: stocks, has_share: trade_type, user_id: user, action_date: date)
      if trade.valid?
        trade.save
        flash[:title] = "Success"
        flash[:msg] = "Trade Added Successfully..!!"
        flash[:type] = "success"
      else
        flash[:title] = "Error"
        flash[:msg] = "Stock Price and Number of shares should be greater than zero."
        flash[:type] = "error"
      end
      redirect_to '/trades/index'
    else
      redirect_to '/'
    end
  end
end
