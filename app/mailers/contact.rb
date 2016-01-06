class Contact < ApplicationMailer
  def contact(message)
    @message = message
    mail(to: "test@test.com", subject: 'Contacto')
  end
  def employee_contact(message)
    @message = message
    mail(to: "test@test.com", subject: 'Contacto')
  end
end