class Slot < ActiveRecord::Base
  belongs_to :doctor
  has_one :appointment
  has_one :patient , :through => :appointment
  validates_presence_of :slot_start_time
  validates_presence_of :slot_end_time
  validates_presence_of :slot_date
end
