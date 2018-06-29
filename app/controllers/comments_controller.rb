class CommentsController < ApplicationController
  helper_method :current_user
  before_action :require_login

  def write
    comment = params[:comment]
    trade_id = params[:post] # trade_id
    user_id = current_user.id
    comment = Comment.new(comment: comment, trade_id: trade_id, user_id: user_id)
    if comment.valid?
      comment.save
    else
      flash[:title] = "Error"
      flash[:msg] = "Write a Comment.."
      flash[:type] = "error"
    end
    redirect_to '/public_feed'
  end
end
