class LikesController < ApplicationController
  def create
    like = Like.new
    like.user_id = current_user.id
    like.micropost_id = params[:micropost_id]
    like.save
    redirect_back(fallback_location: root_url)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_back(fallback_location: root_url)
  end
end
