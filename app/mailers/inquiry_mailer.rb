class InquiryMailer < ApplicationMailer

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
end
