class Public::OrdersController < ApplicationController
  def new
    @cart_items = current_customer.cart_items
    if @cart_items.present?
    @order = Order.new
    # 登録済み住所選択プルダンに使用
    @addresses = Address.where(customer: current_customer)
    # 新規入力住所に使用
    # @new_address = @order.address
    # @new_postal_code = @order.postal_code
    # @new_name = @order.name
    else
    redirect_to cart_items_path,flash:{alert:'カートに商品が入っていません。'}
    end
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
      # 12/23タネサカ下記find_byをfindへ変更
      @chosen_address = Address.find(params[:order][:address_id])
      @order.postal_code = @chosen_address.postal_code
      @order.address = @chosen_address.address
      @order.name = @chosen_address.name
    # 新しいお届け先を選択した場合
    else
      @order.postal_code = params[:order][:new_postal_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:new_name]

      # 郵便番号、住所、氏名がどれかでも抜けていればrenderする条件式12/24タネサカ
      unless
        @order.postal_code.present? & @order.address.present? & @order.address.present?
        @addresses = Address.where(customer: current_customer)
        flash.now[:alert] = "お届け先が入力されていませんでした。再度支払方法からご入力ください。"
        render "new"
      end

    end

  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save

    @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price
        @order_details.amount = cart_item.amount
        @order_details.save
     end
    current_customer.cart_items.destroy_all
   
    # 新規住所を使用した場合のみお届け先に登録する
     if params[:order][:shipping_address].present?
        @address = Address.new
        @address.customer_id = current_customer.id
        @address.name = @order.name
        @address.postal_code = @order.postal_code
        @address.address = @order.address
        @address.save
     end
     
   redirect_to  complete_orders_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def complete
    # 仮です。本来はうえのIndexへの記載です。
    @orders = current_customer.orders
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :shipping_cost, :total_payment, :status, :name, :address , :postal_code, :customer_id )
  end

end
