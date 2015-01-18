class NotificationMailer < ActionMailer::Base
  default from: "info@notjustadate.com"

  def signup_receipt(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Not Just a Date')
  end

  def purchase_notification(purchase)
  	@user = current_user
    @purchase = purchase
  	mail(to: 'matt@notjustadate.com', subject: 'New purchase from Not Just a Date')
  end

  def purchase_receipt(purchase)
  	@user = current_user
    @purchase = purchase
  	mail(to: @user.email, subject: 'Your Not Just a Date booking')
  end

end
