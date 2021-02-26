class PaymentsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @order = @booking.orders.last
  end
end
