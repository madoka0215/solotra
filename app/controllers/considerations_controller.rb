class ConsiderationsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    tour = Tour.find(params[:tour_id])
    current_user.consider(tour)
    flash[:success] = '検討リストに登録しました。'
    redirect_to tour
  end

  def destroy
    tour = Tour.find(params[:tour_id])
    current_user.notconsider(tour)
    flash[:success] = '検討リストから削除しました。'
    redirect_to tour
  end
end
