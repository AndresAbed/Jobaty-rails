require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'has a valid factory' do
    expect(build(:employee)).to be_valid
  end
  it 'is invalid without a first_name' do
    expect(build(:employee, first_name: nil)).to_not be_valid
  end
  it 'is invalid without a last_name' do
    expect(build(:employee, last_name: nil)).to_not be_valid
  end
  it 'is invalid without a email' do
    expect(build(:employee, email: nil)).to_not be_valid
  end
  it 'is invalid without a password' do
    expect(build(:employee, password: nil)).to_not be_valid
  end
end
