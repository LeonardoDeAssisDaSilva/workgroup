class ApplicationMailer < ActionMailer::Base
  default from: APP_CONFIG['support_email']
  layout 'mailer'
end
