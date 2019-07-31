class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
     customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )
<<<<<<< HEAD
   charge = Stripe::Charge.create(
=======
  charge = Stripe::Charge.create(
>>>>>>> master
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.total_cost * 100,
    description:  "Payment for for order #{@order.id}",
    currency:     "USD"
  )

<<<<<<< HEAD
  redirect_to feedback_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
=======
    @order.update(payment: charge.to_json, state: 'paid')
    redirect_to feedback_path(@order)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_order_payment_path(@order)
>>>>>>> master
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
    @order.user = current_user
  end
end
