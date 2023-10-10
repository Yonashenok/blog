class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.page(params[:page]).per(3)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params.require(:post).permit(:title, :text))
    if @post.save
      flash[:notice] = 'Post was created seccesufuly'
      redirect_to user_path(id: current_user)
    else
      render :new
    end
  end
end
