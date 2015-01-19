class EnquiryMailer < ActionMailer::Base
  default from: "info@notjustadate.com"

  def enquiry_message(enquiry)
  	@message = enquiry.message
  	@email = enquiry.email
  	@name = enquiry.name
  	mail(to: "heloiselak@notjustadate.com", subject: "enquiry from Not Just a Date")
  end

  def purchase_notification(purchase)
  	@email = purchase.user.email
  	@purchase = purchase
  	mail(to: "heloiselak@notjustadate.com", subject: "purchase from Not Just a Date")
  end

  def user_purchase_notification(purchase)
  	@email = purchase.user.email
  	mail(to: @email, subject: "thank you for booking with Not Just a Date")
  end

end
