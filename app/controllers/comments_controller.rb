class CommentsController < ApplicationController
  
  def create
    commentable = Shayari.find(params[:shayari_id])
    unless params[:comment] === "" || params[:comment] === nil
      commentable.comments.create(:comment => params[:comment], :user_id => session[:user_id])
    end
    redirect_to(shayari_path(params[:shayari_id]))
  end
  
  def destroy
    comment = Comment.find(params[:id])
    if (comment.user_id === session[:user_id] || Shayari.find(comment.commentable_id).user_id === session[:user_id].to_i)
      comment.destroy
    end
    redirect_to(shayari_path(params[:shayari_id]))
  end
  
end
