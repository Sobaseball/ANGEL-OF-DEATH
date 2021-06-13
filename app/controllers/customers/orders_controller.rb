class Customers::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items

  end

  def create
    @order = current_customer.orders.new(order_params)
    # binding.pry
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
			@order_item = OrderItem.new(order_id: @order.id,item_id: cart_item.item_id,amount: cart_item.amount,price_at: cart_item.item.price,is_production: "製作不可")
			@order_item.save
		end
    current_customer.cart_items.destroy_all
    redirect_to customers_orders_done_path
  end

  def check
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.freight = 800
    if params[:order][:address_option] == "0"
      @order.shipping_postalcode = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.superscription = current_customer.first_name + current_customer.last_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:oder][:address_id])
      @order.shipping_postalcode = @address.postal_code
      @order.shipping_address = @address.address
      @order.superscription = @address.name

    elsif params[:order][:address_option] == "2"
      @order.shipping_postalcode = params[:order][:shipping_postalcode]
      @order.shipping_address = params[:order][:shipping_address]
      @order.superscription = params[:order][:superscription]
    end
    InquiryMailer.order_mail(current_customer.email).deliver_now
  end

    # if params[:oder][:addrress_option] == "0"


  def done
  end

 private
  def order_params
    params.require(:order).permit(:order_id, :freight, :subtotal, :payment, :superscription, :shipping_address, :shipping_postalcode, :is_order)
  end
end
