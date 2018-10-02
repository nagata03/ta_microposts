class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_micropost

  def create
    current_user.like(@micropost)
    flash[:success] = 'Micropostをお気に入りに追加しました'
    redirect_to root_url
  end

  def destroy
    current_user.unlike(@micropost)
    flash[:success] = 'Micropostのお気に入りを解除しました'
    redirect_to root_url
  end
  
  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

end
