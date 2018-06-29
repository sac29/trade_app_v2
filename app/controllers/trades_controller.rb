class TradesController < ApplicationController
  protect_from_forgery with: :exception

  # TODO: before_actions :require_login, :without_user
  # TODO: helper_method :current_user

  def index
    if session.key?(:user)
      @my_trades = Trade.where(user_id: session[:user]['id']).order(action_date: :desc, updated_at: :desc)
    else
      redirect_to '/'
    end
  end

  def public_feed
    from = params.has_key?(:from) && params[:from].to_i > 0 ? params[:from].to_i : 0
    limit = params.has_key?(:limit) && params[:limit].to_i > 0 ? params[:limit].to_i : 5
    trade_query = Trade.all
    @trades = trade_query.order(action_date: :desc, updated_at: :desc).limit(limit).offset(from)
    @trades_size = trade_query.count
  end

  def add
    if session.key?(:user)
      company = params[:company]
      stock_price = params[:price]
      stocks = params[:shares]
      trade_type = params[:trade]
      user = session[:user]['id']
      date = params[:action_date]
      trade = Trade.new(company_name: company, stock_price: stock_price, no_of_stocks: stocks, has_share: trade_type, user_id: user, action_date: date)
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
