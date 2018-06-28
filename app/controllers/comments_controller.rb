class CommentsController < ApplicationController
  def write
    if session.key?(:user)
      comment = params[:comment]
      trade_id = params[:post] # trade_id
      user_id = session[:user]['id']
      comment = Comment.new(comment: comment, trade_id: trade_id, user_id: user_id)
      if comment.valid?
        comment.save
      else
          flash[:title] = "Error"
          flash[:msg] = "Write a Comment.."
          flash[:type] = "error"
      end
      redirect_to '/trades/public_feed'
    else
      redirect_to '/'
    end
  end
end
