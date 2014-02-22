# contact mailer class
class ContactMailer < ActionMailer::Base
  default from: APP_CONFIG['MAIL_FROM'], to: APP_CONFIG['MAIL_TO']

  def notify(contact)
    @contact = contact
    mail(subject: "Message from #{contact.name}(#{contact.email})")
  end
end
