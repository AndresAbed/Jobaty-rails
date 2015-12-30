class CompaniesController < ApplicationController
  def index
  end
  def candidates
  end
  def contact
    message = Message.new(params[:contact])
    if message.valid?
      Contact.contact(message).deliver
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