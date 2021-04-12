class UserMailer < ApplicationMailer
  default from: 'hermes@hades.net'

  def welcome_email
    @email = params[:email]
    @name = params[:name]
    @url = 'http://hades.net'
    mail(to: @email, subject: 'Welcome to HELL')
  end
end
