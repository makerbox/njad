class EnquiryMailer < ActionMailer::Base
  default from: "info@notjustadate.com"

  def enquiry_message(enquiry)
  	@message = enquiry.message
  	@email = enquiry.email
  	@name = enquiry.name
  	# mail(to: "heloiselak@notjustadate.com", subject: "enquiry from Not Just a Date")
  	mail(to: "maker-box@hotmail.com", subject: "testing enquiry form")
  end

end
