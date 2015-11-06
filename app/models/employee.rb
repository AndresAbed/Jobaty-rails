class Employee < User
  has_many :job_experiences
  has_many :degrees
end
