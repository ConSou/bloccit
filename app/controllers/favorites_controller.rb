class FavoritesController < ApplicationController
  before_action :require_sign_in

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Post was successfully favorited"
    else
      flash[:alert] = "Failed to favorite post, please try again"
    end
    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "You have unfavorited post"
    else
      flash[:alert] = "Failed to unfavorite post, please try again"
    end
    redirect_to [post.topic, post]
  end


end
