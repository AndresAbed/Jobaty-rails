class ConfirmationsController < DeviseController
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      @flag = true
      respond_to do |format|
        format.js {flash[:alert] = "Las instrucciones para confirmar tu cuenta fueron reenviadas a tu correo."}
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_flashing_format?
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
      flash[:notice] = "La cuenta ya fue confirmada, intenta iniciar sesión"
    end
  end

  protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      case resource_name
      when :employee
        root_path
      when :company
        companies_path
      end
    end

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      case resource
      when Employee
        root_path
      when Company
        companies_path
      end
    end

    def translation_scope
      'devise.confirmations'
    end
end