class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
   	if Invitation.find_by(email: current_user.email)
        @membership = Membership.new
        @membership.user = current_user
        @membership.group = Invitation.find_by(email: current_user.email).group
        @membership.save 
    else
        NotificationMailer.signup_receipt(current_user).deliver
    end	
  end

end