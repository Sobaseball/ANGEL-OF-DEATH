class InquiryMailer < ApplicationMailer
  helper ApplicationHelper

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to:   'so.baseball1@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end

  def anser_mail(anser, email)
    @anser = anser
    mail(
      from:    'so.baseball1@gmail.com',
      to:      email,
      subject:'お問い合わせ通知'
    )
  end

  def sign_up_mail(email)

    mail(
      from:    'so.baseball1@gmail.com',
      to:      email,
      subject:'新規登録完了通知'
    )
  end

  def order_mail(email)

    mail(
      from:    'so.baseball1@gmail.com',
      to:      email,
      cc:      'so.baseball1@gmail.com',
      subject:'注文確認通知'
    )
  end
end
