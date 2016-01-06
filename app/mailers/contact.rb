class Contact < ApplicationMailer
  def company_index_contact(message)
    @message = message
    mail(to: "test@test.com", subject: 'Contacto')
  end
  def employee_contact(message)
    @message = message
    mail(to: "test@test.com", subject: 'Contacto')
  end
end