FactoryGirl.define do
  factory :employee do
    id '1'
    first_name 'Employee'
    last_name 'Fake'
    email 'employee@example.com'
    password '12345'
  end
end