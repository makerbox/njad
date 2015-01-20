class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if current_user.profile
      profile_path(current_user.profile)
    else
      new_profile_path
    end
  end

  def after_sign_up_path_for(resource)
    # if Invitation.find_by(email: self.email)
    #   @membership = Membership.new
    #   @membership.user = self
    #   @membership.group = Invitation.find_by(email: self.email).group
    #   @membership.save 
    # else
    #   NotificationMailer.signup_receipt(self).deliver
    # end
  end

end
