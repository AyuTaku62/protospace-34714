class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototype = @comment.prototype
    @comments = @prototype.comments
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else
      render "prototypes/show"
    end
  end
  

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
