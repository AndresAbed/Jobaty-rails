class Message
  include ActiveModel::Model
  attr_accessor :company, :email, :phone, :plan, :subject, :message

  validates_presence_of :company
  validates_presence_of :email
  validates_presence_of :subject
  validates_presence_of :message
end