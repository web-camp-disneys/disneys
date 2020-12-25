class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
    if @order_detail.making_status = 2
      @order_detail.order.update(status: 2)
    else @order_details.making_status = 3
      @order_detail.order.update(status: 3)
    end
    redirect_to admins_order_path(@order_detail.order)
  end

    private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
