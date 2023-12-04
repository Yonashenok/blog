class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user: current_user, post: @post)

    if @like.save
      flash[:notice] = 'You liked this post!'
      redirect_to user_posts_path
    else
      flash[:alert] = 'Something went wrong!'
      render :new
    end
  end
end
