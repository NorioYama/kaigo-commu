class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    if @comment.save
      CommentChannel.broadcast_to @post, { comment: @comment, user: @comment.user }
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id,post_id: params[:post_id])
  end
end
