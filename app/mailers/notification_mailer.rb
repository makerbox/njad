class NotificationMailer < ActionMailer::Base
  default from: "info@notjustadate.com"

  def signup_receipt(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Not Just a Date')
  end

  def purchase_notification(user, purchase)
  	@user = user
  	mail(to: @user.email, subject: 'New purchase from Not Just a Date')
  end

  def purchase_receipt(user, purchase)
  	@user = user
  	mail(to: @user.email, subject: 'Your Not Just a Date booking')
  end

end
