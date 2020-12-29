
[1mFrom:[0m /home/ec2-user/environment/disneys/app/controllers/public/orders_controller.rb:67 Public::OrdersController#create:

    [1;34m54[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m55[0m:   @order = current_customer.orders.new(order_params)
    [1;34m56[0m:   @order.save
    [1;34m57[0m: 
    [1;34m58[0m:   @cart_items = current_customer.cart_items.all
    [1;34m59[0m:    @cart_items.each [32mdo[0m |cart_item|
    [1;34m60[0m:       @order_details = @order.order_details.new
    [1;34m61[0m:       @order_details.item_id = cart_item.item.id
    [1;34m62[0m:       @order_details.price = cart_item.item.price
    [1;34m63[0m:       @order_details.amount = cart_item.amount
    [1;34m64[0m:       @order_details.save
    [1;34m65[0m:    [32mend[0m
    [1;34m66[0m:   current_customer.cart_items.destroy_all
 => [1;34m67[0m:   binding.pry
    [1;34m68[0m:   [1;34m# 新規住所を使用した場合のみお届け先に登録する[0m
    [1;34m69[0m:    [32mif[0m params[[33m:order[0m][[33m:new_address[0m].present?
    [1;34m70[0m:       @address = [1;34;4mAddress[0m.new(address_params)
    [1;34m71[0m:       @order.name = @address.name
    [1;34m72[0m:       @order.postal_code = @address.postal_code
    [1;34m73[0m:       @order.address = @address.address
    [1;34m74[0m:       @address.save
    [1;34m75[0m:    [32mend[0m
    [1;34m76[0m:    
    [1;34m77[0m:  redirect_to  complete_orders_path
    [1;34m78[0m: [32mend[0m

