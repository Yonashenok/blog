class CommentsController < ApplicationController
  load_and_authorize_resource
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comments_params)
    if @comment.save
      flash[:notice] = 'Comment was created seccesufuly'
      redirect_to user_posts_path
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment was Deleted seccesufuly"
    redirect_to user_posts_path
  end

  def comments_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
