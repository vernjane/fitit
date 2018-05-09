class UserMailer < ApplicationMailer
    default from: 'info@tryitontoday.com'
 
  def welcome_email
    email = "vern.jane@gmail.com"
    subject = "Welcome to Try It On Today"
    mail(to: email, subject: subject)
  end
end
