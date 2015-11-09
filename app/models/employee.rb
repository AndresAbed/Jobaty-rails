class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :job_experiences
  has_many :degrees
  has_many :interested_jobs
end
