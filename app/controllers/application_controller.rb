class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){|u| 
      u.permit(:first_name, :last_name, :email, :name, :password, 
        :password_confirmation, :profile_img)}
    devise_parameter_sanitizer.for(:sign_in){|u| 
      u.permit(:email, :password)}
    devise_parameter_sanitizer.for(:account_update){|u| 
      u.permit()}
  end

  helper_method :current_employee, :loged_in_using_OAuth?,
                :resource_name, :resource, :resource_name_company, :resource_company

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
    case resource
    when Employee
      offers_path
    when Company
      candidates_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
      when :employee, Employee
        root_path
      when :company, Company
        companies_path
    end
  end

  def resource_name
    :employee
  end
 
  def resource
    @resource ||= Employee.new
  end

  def resource_name_company
    :company
  end
 
  def resource_company
    @resource ||= Company.new
  end
end
