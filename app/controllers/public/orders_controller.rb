class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to complete_public_orders_path
    
    if params[:shipping_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    end
    
    if params[:shipping_address] == "1"
      @order.postal_code = current_customer.address.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    end
    
    
    if params[:shipping_address] == "2"
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
      @address.save
    end
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
    params.require(:order).permit(:payment_method, :shipping_cost, :total_payment, :status, :name, :address , :postal_code )
  end
  
end
