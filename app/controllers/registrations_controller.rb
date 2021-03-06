class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      @flag = true
      respond_to do |format|
        format.js {flash[:alert] = "Gracias por registrarte! Recibirás un correo con instrucciones para confirmar tu cuenta."}
      end
    else  
      respond_to do |format|
        format.js
      end
    end  
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
    end
  end
end 
