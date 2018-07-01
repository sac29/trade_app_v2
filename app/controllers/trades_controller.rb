class TradesController < ApplicationController
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :require_login, except: [:public_feed]

  def index
    @my_trades = Trade.where(user_id: current_user.id).order(action_date: :desc, updated_at: :desc)
  end

  def public_feed
    from = params.has_key?(:from) && params[:from].to_i > 0 ? params[:from].to_i : 0
    limit = params.has_key?(:limit) && params[:limit].to_i > 0 ? params[:limit].to_i : 5
    trade_query = Trade.includes(:comments => :user).includes(:user).includes(:likes => :user).all
    @trades = trade_query.order(action_date: :desc, updated_at: :desc).limit(limit).offset(from)
    @trades_size = trade_query.count
  end

  def add
    company = params[:company]
    stock_price = params[:price]
    stocks = params[:shares]
    trade_type = params[:trade]
    user = current_user.id
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
    redirect_to '/trades'
  end
end
