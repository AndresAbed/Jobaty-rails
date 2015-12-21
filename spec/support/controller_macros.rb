module ControllerMacros
  def login_employee
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:employee]
      employee = FactoryGirl.create(:employee)
      #employee.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in employee
    end
  end

  def login_company
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:company]
      company = FactoryGirl.create(:company)
      #company.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in company
    end
  end
end