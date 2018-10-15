class Medicalreport < ActiveRecord::Base
  using_access_control
  has_attached_file :record,
  :url => '/system/:attachment/:id/:style/:basename.:extension',
  :path => ':rails_root/public/system/:attachment/:id/:style/:basename.:extension'
  has_one :doctor
  has_one :patient
  validates_presence_of :medication
  validates_presence_of :record_file_name
end