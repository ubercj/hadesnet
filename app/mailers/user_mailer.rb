class UserMailer < ApplicationMailer

  def welcome_email
    @email = params[:email]
    @name = params[:name]
    @url = 'https://hades-net.herokuapp.com'
    mail(to: @email, subject: 'Welcome to HELL')
  end
end
