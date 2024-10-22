class ReservationsController < ApplicationController
  # before_action :load_restaurant, only: [:new, :create]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @restaurants = Restaurant.all
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.save
      redirect_to reservations_path
  end

  private

  # def load_restaurant
  #   @restaurants = Restaurant.all
  #   @restaurant = @restaurants.find(params[:restaurant])
  # end

  def reservations_params
    params.require(:reservation).permit(:jour, :heure, :number_of_guests, :restaurant)
  end

end
