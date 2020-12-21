class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@total_payment = current_customer.cart_item.total
  end

  def create
  end

  def show
  end

  def index
  end

  def confirm
  end

  def complete
  end
  
   private
  def cart_item_params
    params.require(:order).permit(:payment_method, :shipping_cost, :total_payment, :status, :name, :address , :postal_code )
  end
  
end
