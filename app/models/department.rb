class Department < ActiveRecord::Base
  has_many :doctors
  validates_presence_of :name
  validates_presence_of :description
end
