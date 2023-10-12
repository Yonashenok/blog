class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:likes, :comments)

    render json: { success: true, data: @posts }, include: %w[user comments]
  end
end
