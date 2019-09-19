class AdminMailer < ApplicationMailer

default from: 'no-reply@mobinawa.herokuapp.com'
 
  def welcome_email(admin)
    @admin = admin 
    @url  = 'https://mobinawa-development.herokuapp.com' 
    mail(to: @admin.email, subject: 'Bienvenue au sein du réseau Mobinawa') 
  end
end
