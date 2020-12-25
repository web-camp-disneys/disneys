class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all.order(id: "DESC")
    # @order_detail = @order.order_detail
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status = 1
      @order.order_details.update(making_status: 1)
    end
    redirect_to admins_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
