class Bed < ActiveRecord::Base
  belongs_to :room
  has_many :patient_to_beds
  has_many :patients, :through => :patient_to_beds
  validates_presence_of :bed_number
end
