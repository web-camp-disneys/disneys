class Public::CartItemsController < ApplicationController

  def create
     @cart_item = CartItem.new(cart_item_params)
     if @cart_item.amount.present?
   # すでにカートにある商品を追加した場合、数量表示のみを変更する
       @cart_items = current_customer.cart_items.all
       @cart_items.each do |cart_item|
         if cart_item.item_id == @cart_item.item_id
           new_amount = cart_item.amount + @cart_item.amount
           cart_item.update_attribute(:amount, new_amount)
           @cart_item.delete
         end
       end
# ここまで
       @cart_item.save
       redirect_to cart_items_path
     else
       redirect_to public_item_path(@cart_item.item.id)
     end
  end

 def index
   @cart_items = CartItem.all
 end

 def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
 end

 def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
 end

 	def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
	end

   private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end