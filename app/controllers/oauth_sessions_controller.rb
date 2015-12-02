class OauthSessionsController < ApplicationController
  def create_oauth_session
    employee = Employee.from_omniauth(env["omniauth.auth"])
    session[:employee_id] = employee.id
    redirect_to  index_path
  end

  def destroy_oauth_session
    session[:employee_id] = nil
    redirect_to root_path
  end
end