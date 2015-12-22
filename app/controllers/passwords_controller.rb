class PasswordsController < Devise::PasswordsController
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      @flag = true
      respond_to do |format|
        format.js {flash[:notice] = "Recibirás un correo electrónico con instrucciones sobre cómo restablecer tu contraseña en unos minutos."}
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      redirect_to root_path
      flash[:notice] = "Tu contraseña fue actualizada"
    else
      set_minimum_password_length
      respond_with resource
    end
  end
  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    case resource_name
    when :employee
      root_path
    when :company
      companies_path
    end
  end
end