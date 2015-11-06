class Employee < User
  has_many :job_experiences
  has_many :degrees
  has_many :interested_jobs
end
