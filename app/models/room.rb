require "faster_csv"
class Room < ActiveRecord::Base
  has_many :beds
  validates_presence_of :room_number
end
