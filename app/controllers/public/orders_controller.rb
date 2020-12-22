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

  

  def confirm
    @order = Order.new
    @order.payment_method = params[:order][:payment_method].to_i 
    @cart_items = current_customer.cart_items
    
    # ご自身の住所を選択した場合
    if params[:order][:shipping_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
    # 登録済み住所から選択した場合
    elsif params[:order][:shipping_address] == "1"
      @chosen_address = Address.find_by(params[:order][:address_id])
      @order.postal_code = @chosen_address.postal_code
      @order.address = @chosen_address.address
      @order.name = @chosen_address.name
    # 新しいお届け先を選択した場合
    else
      @order.postal_code = params[:order][:new_postal_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:new_name]
    end
    
  end
  
  def create
    @order = Order.new(order_params)
    # 登録済み住所選択プルダンに使用
    @chosen_address = Address.find_by(params[:order][:address_id])
    # 新規入力住所に使用
    @new_address = @order.address
    @new_postal_code = @order.postal_code
    @new_name = @order.name
  end
  
  def index
  end

  def show
  end

  def complete
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :shipping_cost, :total_payment, :status, :name, :address , :postal_code, :customer_id )
  end
  
end
