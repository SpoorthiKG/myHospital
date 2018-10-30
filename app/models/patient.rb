class Patient < ActiveRecord::Base
  attr_accessor :password
  validates_presence_of :first_name,:middle_name,:last_name,:date_of_birth,
    :email,:gender,:address,:blood_group 
  before_save :encryption
  after_create :user_record
  has_one :user , :as => :user_determin
  has_many :appointments
  has_many :doctors , :through => :appointments
  has_many :doctor_sugggested_patient
  has_one :patient_to_bed
  has_one :bed , :through => :doctor_sugggested_patient
  after_save :change_user_password , :if => Proc.new{|p| !p.new_record? and  p.encrypted_password_changed?}
  def change_user_password
    user.encrypted_password = self.encrypted_password
    user.save
  end
  def user_record
    User.create_user(self)
  end
  def encryption 
    User.encrypt_password(self)
  end
  
  
 end
