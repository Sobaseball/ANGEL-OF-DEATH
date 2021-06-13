class AnsersController < ApplicationController
  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @anser = Anser.new
    if @anser.invalid?
      render :new
    end
    # InquiryMailer.anser_mail(@inquiry).deliver_now
  end

  def back
    @anser = Anser.new(inquiry_params)
    render :new
  end

  def create
    email = params[:email]
    @anser = Anser.new(ansers_params)
    if @anser.save
      InquiryMailer.anser_mail(@anser, email).deliver_now
      redirect_to ansers_path
    else
      render :new
    end
  end

  def ansers_params
    params.require(:anser).permit(:message)
  end
end
