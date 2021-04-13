class UserMailer < ApplicationMailer
  default from: 'Hermes <ubercj@gmail.com>'

  def welcome_email
    @email = params[:email]
    @name = params[:name]
    @url = 'http://hades-net.herokuapp.com'
    mail(to: @email, subject: 'Welcome to HELL')
  end
end
