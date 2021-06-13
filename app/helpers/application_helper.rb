module ApplicationHelper
  def customer_my_page_url_for_sign_up
    if Rails.env.development?
      "https://6e56b0610aa74f02b9ef32622510e31b.vfs.cloud9.us-east-1.amazonaws.com/customers/my_page"
    else
     #本番環境設定後にURL追加する
    end
  end


end
