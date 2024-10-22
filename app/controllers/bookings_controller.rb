class BookingsController < ApplicationController
before_action :load_restaurant, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking = @restaurant.bookings.build
  end

  def create
    @booking = @restaurant.bookings.build(bookings_params)
    if @booking.save
      redirect_to bookings_path
    end
  end

  private
    def load_restaurant
      @restaurant = Restaurant.find params[:restaurant_id]
    end

    def bookings_params
      params.require(:booking).permit(:date, :time, :restaurant_id)
    end
end
