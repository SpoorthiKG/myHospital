class Bed < ActiveRecord::Base
  belongs_to :room
  has_many :patient_to_beds
  has_many :patients, :through => :patient_to_beds
end
