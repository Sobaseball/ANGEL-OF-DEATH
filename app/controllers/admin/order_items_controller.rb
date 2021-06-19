class Admin::OrderItemsController < ApplicationController
  def update
     @order_item = OrderItem.find(params[:id])
     @order = @order_item.order
     @order_item.update(order_item_params)
    if @order_item.is_production == "製作中"
      @order.update(is_order: "製作中")
    elsif @order.order_items.where.not(is_production: "製作完了").count == 0
      @order.update(is_order: "発送準備中")

    end
    redirect_to admin_order_path(@order)
  end


  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :amount, :size, :is_production, :price_at)
  end
end
