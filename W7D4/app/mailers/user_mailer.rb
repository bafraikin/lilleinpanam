class UserMailer < ApplicationMailer
    default from: 'lilleinpanam@gmail.com'
 
  def welcome_email
    @user = params[:user]
    @url  = 'https://w7d4.herokuapp.com/' # app heroku
    mail(to: @user.email, subject: 'Rejoins la communauté des Hackeurs !')
  end
end
