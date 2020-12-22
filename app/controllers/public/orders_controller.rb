class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def create
    @order = Order.new(order_params)

    if params[:order][:shipping_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    elsif params[:order][:shipping_address] == "1"
      @order.postal_code = current_customer.address_id.postal_code
      @order.address = current_customer.address_id.address
      @order.name = current_customer.address_id.name
    else 
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
      @address.save
    end
    
    @order.save
    redirect_to complete_public_orders_path
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
  def order_params
    params.require(:order).permit(:payment_method, :shipping_cost, :total_payment, :status, :name, :address , :postal_code, :customer_id )
  end
  
end
