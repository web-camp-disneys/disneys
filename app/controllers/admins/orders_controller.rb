class Admins::OrdersController < ApplicationController
  def index
    if params[:customer_flag] == "true"
      # customer_flagがtrueの記述の場合の処理
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.order(id: "DESC").page(params[:page]).per(10)
      # 赤文字のorderは順番指定の記述(id)順に並べている
    else
      # 違う場合でheaderの注文履歴一覧を表示
      @orders = Order.where.order(id: "DESC").page(params[:page]).per(10)
      # 赤文字のorderは順番指定の記述(id)順に並べている
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.order_details.update(making_status: 1)
    end
    redirect_to admins_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end

end
