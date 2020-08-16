class BookingsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_booking, only: [:show, :update, :destroy]
  before_action :set_tour, :set_user, only:[:new, :create]
  
  def index
    if current_user.admin?
      @booking = Booking.new
      @bookings = Booking.order('created_at DESC')
    else
      redirect_to root_url
    end
  end
  
  def show
  end
  
  def new
    @booking = current_user.bookings.build(tour_id: @tour.id)
  end
    
  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      flash[:success] = 'リクエストを送信しました'
      redirect_to root_url
    else
      flash.now[:danger] = '送信に失敗しました'
      render :new
    end
  end
  
  def edit
    if current_user.admin?
      set_booking
    else
      redirect_to root_url
    end
  end
  
  def update
    if @booking.update(booking_params)
      flash[:success] = '更新されました'
      redirect_to @booking
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @booking.destroy
    flash[:success] = '削除しました'
    redirect_to bookings_url
  end
  
  private
  
  def set_booking
    @booking = Booking.find(params[:id])
  end
  
  def set_tour
    @tour = Tour.find(params[:tour_id])
  end
  
  def set_user
    @user = current_user
  end
  
  def booking_params
    params.require(:booking).permit(
      :departure_date,
      :airplane_grade,
      :hotel_grade,
      :remarks_column,
      :status,
      :tour_id)
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to new_user_session_url
    end
  end

end
