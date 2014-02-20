# contact mailer class
class ContactMailer < ActionMailer::Base
  default from: 'noreply@prologic.com.ua', to: APP_CONFIG['MAIL_TO']

  def notify(contact)
    @contact = contact
    mail(subject: "Message from #{contact.name}(#{contact.email})")
  end
end
