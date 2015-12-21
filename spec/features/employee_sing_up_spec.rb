require 'rails_helper'

RSpec.feature "EmployeeSingUp", type: :feature do
  scenario 'with valid attributes', js: true do
    visit root_path
    click_on 'Registrarse'
    fill_in 'signup-first-name', with: 'Employee'
    fill_in 'signup-last-name', with: 'Test'
    fill_in 'signup-email', with: 'test@test.com'
    fill_in 'signup-password', with: '12345'
    fill_in 'signup-confirm-password', with: '12345'
    click_on 'Create account'

    expect(current_path).to eq(offers_path)
  end
end
