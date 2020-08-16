class ToursController < ApplicationController
  before_action :set_index, only: [:index, :search, :nagoya, :osaka, :fukuoka]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      flash[:success] = '投稿しました'
      redirect_to tours_url
    else
      @tours = Tour.order('created_at DESC')
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @tour.update(tour_params)
      flash[:success] = '更新されました'
      redirect_to @tour
    else
      @tours = Tour.order('created_at DESC')
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @tour.destroy
    flash[:success] = '削除しました'
    redirect_to tours_url
  end
  
  def search
  end
  
  def nagoya
  end
  
  def osaka
  end
  
  def fukuoka
  end

  private
  
  def set_index
    @tour = Tour.new
    @tours = Tour.order('created_at DESC')
    if params[:departure].present?
      @tours = @tours.get_by_departure params[:departure]
    end
    if params[:arrival].present?
      @tours = @tours.get_by_arrival params[:arrival]
    end
    if params[:length_of_stay].present?
      @tours = @tours.get_by_days params[:length_of_stay]
    end
  end
  
  def set_tour
    @tour = Tour.find(params[:id])
  end
  
  def tour_params
    params.require(:tour).permit(
      :tour_name,
      :image,
      :number_of_night,
      :length_of_stay,
      :departure,
      :arrival,
      :city,
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
