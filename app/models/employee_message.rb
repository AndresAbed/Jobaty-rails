class EmployeeMessage
  include ActiveModel::Model
  attr_accessor :subject, :message

  validates_presence_of :subject, :message
end