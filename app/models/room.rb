require "faster_csv"
class Room < ActiveRecord::Base
  has_many :beds
end
