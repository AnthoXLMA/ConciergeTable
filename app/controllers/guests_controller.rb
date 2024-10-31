class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @guest = Guest.new
  end

  def show
    @guest  = Guest.find(params[:id])
    @task   = Task.new
    # @guests = Guest.all
    @guest_tasks  = Task.where(guest_id: @guest)
  end

  def create
    @hotel          = Hotel.find(params[:hotel_id])
    @guest          = Guest.new(guest_params)
    @guest.hotel    = @hotel
    if @guest.save
      redirect_to hotels_path(@hotel)
    else
      render "hotels/show"
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:last_name, :first_name, :date_d_arrivee)
  end
end
