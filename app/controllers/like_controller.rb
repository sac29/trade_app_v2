class LikeController < ApplicationController
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :require_login

  def add
    trade_id = params[:id]
    user_id = current_user.id
    like = Like.new(trade_id: trade_id, user_id: user_id)
    if like.valid?
      like.save
    else
      flash[:title] = 'Error'
      flash[:msg] = 'You have already liked this.'
      flash[:type] = 'error'
    end
    redirect_to '/public_feed?from='+params[:from].to_s+'&limit='+params[:limit].to_s
  end

  def destroy
    trade_id = params[:id]
    user_id = current_user.id
    Like.where(trade_id: trade_id, user_id: user_id).delete_all
    redirect_to '/public_feed?from='+params[:from].to_s+'&limit='+params[:limit].to_s
  end
end
