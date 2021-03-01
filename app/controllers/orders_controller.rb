class OrdersController < ApplicationController
  def create
    booking = Booking.find(params[:booking_id])
    final_price = (booking.check_out - booking.check_in).to_i * booking.island.price_cents
    order = Order.create!(booking: booking, amount: final_price, state: 'pending')

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: booking.island.name,

        #Fix this line, needs to send URL, not currently working
        images: booking.island.image_url,
        amount: final_price,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: "http://localhost:3000/my_bookings",
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_booking_order_payment_path(booking, order)
  end

  def show
    # @booking = Booking.find(params[:booking_id])
    @order = Order.find(params[:id])
    # @order = @booking.orders.last
    # @order = current_user.orders.find(params[:id])
  end
end
