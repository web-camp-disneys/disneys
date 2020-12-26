class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    @order_details = @order.order_details

     if @order_detail.making_status == "制作中"
      @order_detail.order.update(status: 2)
     elsif @order_details.where(making_status: "製作完了").count == @order_details.count
      @order_detail.order.update(status: 3)
     end
    redirect_to admins_order_path(@order_detail.order)
  end

    private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
