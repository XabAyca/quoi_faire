class UserMailer < ApplicationMailer
  default from: 'xabi@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'http://monsite.fr/login' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attendance_email(attendance)
    @attendance = attendance
    @url = 'http://monsite.fr/login'
    mail(to: @attendance.user.email, subject: "Bien enregistré pour l'événement")
  end 

end