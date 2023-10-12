class Api::V1::CommentsController < ApplicationController

  def index 
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comments = @post.comments.includes(:user)
    render json: {success: true , data: @comments }, include: %w[user ]
  end



  private

  def comments_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id])
  end
end