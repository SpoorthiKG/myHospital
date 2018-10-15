class UserMailer < ActionMailer::Base
  def welcome_email(user)
    recipients user.email
    from "myHospital <admin123@gmail.com>"
    subject "Login Details"
    sent_on Time.now
  end

end
