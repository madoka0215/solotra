class ToursController < ApplicationController
  def index
    @tour = Tour.new
    @tours = Tour.order('created_at DESC')
    @tours = Tour.search(params[:search])
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save!
      flash[:success] = '投稿しました。'
      redirect_to tours_path
    else
      @tours = Tour.order('created_at DESC')
      flash.now[:danger] = '投稿に失敗しました。'
      render 'tours/index'
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end

  private
  def tour_params
    params.require(:tour).permit(
      :tour_name,
      :image,
      :number_of_night,
      :length_of_stay,
      :departure,
      :arrival,
      :base_price,
      :airplane_b_price,
      :airplane_c_price,
      :airplane_d_price,
      :hotel_b_price,
      :hotel_c_price,
      :hotel_d_price,
      :recommend_point,
      :schedule
    )
  end
end
