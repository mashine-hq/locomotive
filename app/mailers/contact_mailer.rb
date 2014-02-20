# contact mailer class
class ContactMailer < ActionMailer::Base
  default from: 'noreply@prologic.com.ua', to: 'mckenn@gmail.com'

  def notify(contact)
    @contact = contact
    mail(subject: "Message from #{contact.name}(#{contact.email})")
  end
end
