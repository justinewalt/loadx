class Job < ApplicationRecord
  belongs_to :hauliers
  belongs_to :shippers
  has_many :addresses
  has_many :job_pictures
end
