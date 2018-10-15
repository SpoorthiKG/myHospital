class Appointment < ActiveRecord::Base
  using_access_control
  belongs_to :doctor
  belongs_to :patient
  belongs_to :slot
  
end
