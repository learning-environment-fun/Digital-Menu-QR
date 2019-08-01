class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
     customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )
   charge = Stripe::Charge.create(

    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.total_cost * 100,
    description:  "Payment for for order #{@order.id}",
    currency:     "USD"
  )

  redirect_to feedback_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message

  end

  private

  def set_order
    @order = Order.find(params[:order_id])
    @order.user = current_user
  end
end
