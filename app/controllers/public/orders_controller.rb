class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    # 登録済み住所選択プルダンに使用
    @addresses = Address.where(customer: current_customer)
    # 新規入力住所に使用
    @new_address = @order.address
    @new_postal_code = @order.postal_code
    @new_name = @order.name
  end

  def create
    @order = Order.new(order_params)
    # 登録済み住所選択プルダンに使用
    @chosen_address = Address.find_by(params[:order][:address_id])
    # 新規入力住所に使用
    @new_address = @order.address
    @new_postal_code = @order.postal_code
    @new_name = @order.name
   
    
    if params[:order][:shipping_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    elsif params[:order][:shipping_address] == "1"
      @order.postal_code = @chosen_address.postal_code
      @order.address = @chosen_address.address
      @order.name = @chosen_address.name
    else 
      @new_postal_code = @order.postal_code
      @new_address = @order.address
      @new_name = @order.name
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
