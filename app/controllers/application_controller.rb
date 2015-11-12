class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :employee_permitted_parameters, if: :devise_controller?

  def employee_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){|u| 
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:sign_in){|u| 
      u.permit(:email, :password)}
    devise_parameter_sanitizer.for(:account_update){|u| 
      u.permit()}
  end

  helper_method :current_employee, :loged_in_using_OAuth?

  alias_method :devise_current_employee, :current_employee
  
  def current_employee
    @current_employee ||= if session[:employee_id]
      Employee.find(session[:employee_id]) 
    else
      devise_current_employee
    end 
  end

  def loged_in_using_OAuth?
    if session[:employee_id]
      Employee.find(session[:employee_id]) 
    end
  end

  def after_sign_in_path_for(resource)
    home_path
  end
end
