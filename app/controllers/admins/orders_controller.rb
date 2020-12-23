class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
    # @order_detail = @order.order_detail
  end

  def show
  end
  
  def update
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :shipping_cost, :total_payment, :status, :name, :address , :postal_code, :customer_id )
  end
  
end
