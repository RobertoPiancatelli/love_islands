class BookingsController < ApplicationController

  def new
    @island = Island.find(params[:island_id])
    @booking = Booking.new
  end

  def create
    @island = Island.find(params[:island_id])
    @booking = Booking.new(booking_params)
    @booking.island = @island
    @booking.user = current_user
    if @booking.save
      redirect_to island_path(@island)
    else
      render :new
    end
  end

  def my_bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guests)
  end
end
