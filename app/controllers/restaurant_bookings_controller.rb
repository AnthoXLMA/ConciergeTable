class RestaurantBookingsController < ApplicationController

  def new
    @restaurant_booking = RestaurantBooking.new
  end

  def create
    @restaurant_booking = RestaurantBooking.new(restaurant_booking_params)
    # @booking.user = current_user
    @restaurant = Restaurant.find(params[:id])
    # @booking.board = @board
    #saving the booking
    @restaurant_booking.save
      redirect_to restaurant_bookings_path(@restaurant_bookings)
  end

end
