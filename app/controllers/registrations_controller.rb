class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.with(user: @user).welcome_email.deliver_later unless resource.invalid?
  end
end
