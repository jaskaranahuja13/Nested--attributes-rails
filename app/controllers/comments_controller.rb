class CommentsController < ApplicationController
  before_action :set_user
  before_action :set_post
  before_action :set_comment , only: [:destroy]
  def index
    @comments = Comment.all
  end
  def create

    @comment = @post.comments.build(comment_params)  # Changed from comment to comments
    @comment.user=@user
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render 'posts/show'  # Changed from redirect_to to render
    end
  end
  def destroy
    if @post.user == @user # Only post creator can delete comments
      @comment.destroy
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted.'
    else
      redirect_to user_post_path(@user, @post), alert: 'You are not authorized to delete this comment.'
    end
  end

  private
  def set_user
    @user= User.find(params[:user_id])
  end
  def set_post
    @post= @user.posts.find(params[:post_id])
  end
  def set_comment
    @comment = @post.comments.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
