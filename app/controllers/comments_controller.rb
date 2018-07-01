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

  def destroy
    comment_id = params[:id]
    comment = Comment.includes(:user).includes(:trade => :user).where(id: comment_id).first
    if current_user.present? && (current_user.id == comment.user.id || current_user.id == comment.trade.user.id)
      comment.delete
    else
      flash[:title] = "Error"
      flash[:msg] = "You can only delete your comments or comments on your post.."
      flash[:type] = "error"
    end
    redirect_to '/public_feed'
  end
end
