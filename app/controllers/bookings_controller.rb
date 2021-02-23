class BookingsController < ApplicationController

  def new
    @island = Island.find(params[:island_id])
    @booking = Booking.new
  end

  def create
    @island = Island.find(params[:island_id])
    @booking = Booking.new(booking_params)
    @booking.island = @island
    if @booking.save || @booking.user = current_user
      redirect_to island_path(@island)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guests, :total_price)
  end
end
