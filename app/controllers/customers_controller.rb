class CustomersController < ApplicationController

  def show
        @customer = Customer.all
    end

    def edit
        @customer = current_customer
    end

    def update
        @customer = current_customer
        if  @customer.update(customer_params)
            redirect_to customers_my_page_path
            flash[:notice] = "会員情報を更新しました"
        else
            render :edit
        end
    end

    def verification

    end

    def withdraw
        @customer = current_customer
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @customer.update(is_active: false)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
end


private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)

  end
