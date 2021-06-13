class Admin::CustomersController < ApplicationController
    def index
        @customers = Customer.with_deleted
        @customers = Customer.page(params[:page]).per(20)
    end

    def show
        @customer = Customer.with_deleted.find(params[:id])

    end

    def edit
        @customer = Customer.find(params[:id])
        @customers = Customer.all
    end

    def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
        redirect_to admin_customers_path(@customer)
    end

     private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :deleted_at, :is_active)
  end

end

