class UserMailer < ApplicationMailer
  default from: 'confirmation@hades.net'

  def welcome_email
    @user = params[:user]
    @url = 'http://hades.net'
    mail(to: @user.email, subject: 'Welcome to HELL')
  end
end
