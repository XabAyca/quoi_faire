class UserMailer < ApplicationMailer
  default from: 'xabi@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://quoi-faire-pau.herokuapp.com/' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attendance_email(attendance)
    @attendance = attendance
    @url = 'https://quoi-faire-pau.herokuapp.com/'
    mail(to: @attendance.user.email, subject: "Bien enregistré pour l'événement")
  end 

end