class Job < ApplicationRecord
  belongs_to :haulier
  belongs_to :shipper
  has_many :addresses
  has_many :job_pictures
end
