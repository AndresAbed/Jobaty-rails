class EmployeesController < ApplicationController
  def index
  end

  def offers
  end

  def profile
  end

  def proposals
  end

  def acepted
  end

  def rejected
  end

  def contact  
  end

  def contact_form
    message = EmployeeMessage.new(params[:contact])
    if message.valid?
      Contact.employee_contact(message).deliver
      @flag = true
      respond_to do |format|
        format.js {flash[:alert] = "Mensaje enviado. Gracias por contactarnos."}
      end
    else
      respond_to do |format|
        format.js {flash[:alert] = "Mensaje no enviado. Asegúrate de completar todos los campos requeridos."}
      end
    end
  end
end