# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    @user = User.first
    @email = @user.email
    @name = @user.name
    @url = 'https://hades-net.herokuapp.com'
    UserMailer.with(name: @name, email: @email).welcome_email
  end
end
