class InquiryController < ApplicationController

  def index
    @inquiries = Inquiry.all
  end

  def new
    @inquiries = Inquiry.new
  end

  # 確認画面を作成する場合はこのような記述になるかと思います。
  # newアクションから入力内容を受け取り、
  # 送信ボタンを押されたらcreateアクションを実行します。
  def check
    @inquiries = Inquiry.new(inquiry_params)
    @inquiries.customer = current_customer
    if @inquiries.invalid?
      render :new
    end
    InquiryMailer.send_mail(@inquiries).deliver_now
  end

  # 入力内容に誤りがあった場合、
  # 入力内容を保持したまま前のページに戻るのが当たり前になっているかと思いますが、
  # backアクションを定義することで可能となります。
  def back
    @inquiries = Inquiry.new(inquiry_params)
    render :new
  end

  # 実際に送信するアクションになります。
  # ここで初めて入力内容を保存します。
  # セキュリティーのためにも一定時間で入力内容の削除を行ってもいいかもしれません。
  def create
    @inquiries = Inquiry.new(inquiry_params)
    if @inquiries.save
      redirect_to done_path
    else
      render :new
    end
  end

  # 送信完了画面を使用する場合お使いください。
  def done
    @inquiries = Inquiry.new(inquiry_params)
    @inquiries.customer = current_customer
    if @inquiries.save
      redirect_to inquiry_done_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name,:message )
  end
end
