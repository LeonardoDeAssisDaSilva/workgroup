class UserMailer < ApplicationMailer
   default :from => 'a17224app@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: @user.email, subject: "Confirmação de email"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
      @user = user
      mail to: user.email, subject: "Redefinição de senha"
  end
end
