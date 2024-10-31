class HotelsController < ApplicationController

  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
    @guest = Guest.new
    @guests = Guest.all
    @hotel_guests = Guest.where(hotel_id: @hotel)
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.save
    redirect_to hotel_path(@hotel)
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
     if @hotel.update(new_hotel_params)
       redirect_to hotel_path(@hotel)
     else
     render :edit
   end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy(new_hotel_params)
      redirect_to hotels_path
  end

  private

  def hotel_params
    params.require(:hotel).permit(:hotel_name, :location, :description)
  end

  def new_hotel_params
    params.require(:hotel).permit(:hotel_name, :location, :description)
  end
end
