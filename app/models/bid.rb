class Bid < ApplicationRecord
  belongs_to :jobs
  belongs_to :hauliers
  belongs_to :shippers
end
