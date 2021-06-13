class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @customers = Customer.all
  end

  def update
     @order = Order.find(params[:id])
     @order_items = @order.order_items
     @order.update(order_params)
     if @order.is_order == "入金確認"
       @order_items.each do |order_item|
         order_item.update(is_production: "製作待ち")
       end
     end
     redirect_to admin_order_path(@order)
  end

  def order_params
    params.require(:order).permit(:order_id, :freight, :subtotal, :payment, :superscription, :shipping_address, :shipping_postalcode, :is_order)
  end

end
