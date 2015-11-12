class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :job_experiences
  has_many :degrees
  has_many :interested_jobs

  has_attached_file :profile_img, :styles => {medium: "300x300"}, 
  :url  => "/images/employees/:id/:style/:basename.:extension"
  validates_attachment_presence :profile_img  
  validates_attachment :profile_img, content_type: { content_type: 
    ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |employee|
      employee.provider = auth.provider
      employee.uid = auth.uid
      employee.first_name = auth.info.first_name
      employee.last_name = auth.info.last_name
      employee.email = auth.info.email
      employee.profile_img = auth.info.image
      employee.oauth_token = auth.credentials.token
      #employee.skip_confirmation!
      employee.save(:validate => false)
    end
  end
end
