class CommentsController < ApplicationController
  
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
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post was Deleted seccesufuly"
    redirect_to user_posts_path
  end

  def comments_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end
