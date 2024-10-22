class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def create
    @guest = Guest.new(guests_params)
    @guest.save
      redirect_to guests_path
  end

  private

  def guests_params
    params.require(:guest).permit(:last_name, :first_name, :date_d_arrivee)
  end
end
