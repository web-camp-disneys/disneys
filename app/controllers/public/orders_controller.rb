class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def create
    @order = Order.new(order_params)
    @order.save
    flash[:notice] = "ご注文が確定しました。"
    redirect_to complete_orders_path

    # もし情報入力でnew_addressの場合ShippingAddressに保存
    if params[:shipping_address == "2"
      @address = Address.new(address_params)
      @address.customer_id = current_customer.id
      @address.save
    end

    # カート商品の情報を注文商品に移動
    @cart_items = current_cart
    @cart_items.each do |cart_item|
    OrderDetail.create(
      product:  cart_item.product,
      order:    @order,
      quantity: cart_item.quantity,
      subprice: sub_price(cart_item)
    )
    end
    # 注文完了後、カート商品を空にする
    @cart_items.destroy_all
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
