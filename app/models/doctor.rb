class Doctor < ActiveRecord::Base
  attr_accessor :password
  before_save :encryption
  has_one :user , :as => :user_determin
  belongs_to :department
  has_many :doctor_suggested_patients
  has_many :slots
  has_many :appointments
  has_many :patients , :through => :appointments
   after_create :user_record
  after_save :change_user_password , :if => Proc.new{|p| !p.new_record? and  p.encrypted_password_changed?}
  validates_presence_of :first_name,:middle_name,:last_name,:date_of_birth,:email,
    :gender,:address,:experience,:qualification
 def user_record
    User.create_user(self)
  end
  
  def change_user_password
    user.encrypted_password = self.encrypted_password
    user.save
  end
  
  private
  def encryption 
    User.encrypt_password(self)
  end
end
