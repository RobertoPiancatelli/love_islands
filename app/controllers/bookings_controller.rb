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

    @booking.total_price = @booking.calculate_total_price
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def my_bookings
    @bookings = current_user.bookings
    
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guests)
  end
end
