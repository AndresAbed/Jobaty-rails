class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :job_experiences
  has_many :degrees
  has_many :interested_jobs

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |employee|
      employee.provider = auth.provider
      employee.uid = auth.uid
      employee.first_name = auth.info.first_name
      employee.last_name = auth.info.last_name
      employee.email = auth.info.email
      employee.oauth_token = auth.credentials.token
      #employee.skip_confirmation!
      employee.save(:validate => false)
    end
  end
end
