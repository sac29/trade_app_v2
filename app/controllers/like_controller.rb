class LikeController < ApplicationController
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :require_login

  def add
    trade_id = params[:id]
    likes_doc = MongoLike.find_or_create_by(trade_id: trade_id)
    likes_doc.user_ids = likes_doc.user_ids | [current_user.id] # | for union , & for intersection
    likes_doc.save
    redirect_to '/public_feed?from='+params[:from].to_s+'&limit='+params[:limit].to_s
  end

  def destroy
    trade_id = params[:id]
    user_id = current_user.id
    trade = MongoLike.where(trade_id: trade_id).first
    user_ids = trade.user_ids
    trade.user_ids = user_ids.reject {|user| user_id==user}
    trade.save
    redirect_to '/public_feed?from='+params[:from].to_s+'&limit='+params[:limit].to_s
  end
end
