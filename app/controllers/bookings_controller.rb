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
    # @island = Island.find(params[:id])
  end

  def my_islands
    @islands = current_user.islands
    # @island = Island.find(params[:id])
  end

  def accept_booking
    @booking = Booking.find(params[:booking_id])
    @booking.status = params[:status]
    @booking.save
    redirect_to my_islands_path
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :guests)
  end
end
