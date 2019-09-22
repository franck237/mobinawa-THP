class AdminMailer < ApplicationMailer

default from: 'no-reply@mobinawa.herokuapp.com'
 
  def welcome_email(admin)
    @admin = admin 
    @url  = 'https://mobinawa.herokuapp.com' 
    mail(to: @admin.email, subject: 'Bienvenue au sein du reseau Mobinawa') 
  end
end
