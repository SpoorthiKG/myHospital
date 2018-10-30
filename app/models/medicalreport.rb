class Medicalreport < ActiveRecord::Base
  has_attached_file :record,
  :url => '/system/:attachment/:id/:style/:basename.:extension',
  :path => ':rails_root/public/system/:attachment/:id/:style/:basename.:extension'
  validates_presence_of :medication
  validates_presence_of :comments
  validates_presence_of :record_file_name
  has_one :doctor
  has_one :patient
  
end