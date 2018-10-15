class Doctor < ActiveRecord::Base
   #using_access_control
  attr_accessor :password
  before_save :encrypt_password
 has_one :user , :as => :user_determin
 belongs_to :department
 has_many :doctor_suggested_patients
 has_many :slots
 has_many :appointments
 has_many :patients , :through => :appointments
  after_create :create_user
  after_save :change_user_password , :if => Proc.new{|p| !p.new_record? and  p.encrypted_password_changed?}
  validates_presence_of :first_name
  validates_presence_of :middle_name
  validates_presence_of :last_name
  validates_presence_of :date_of_birth
  validates_presence_of :email
  validates_presence_of :gender
  validates_presence_of :address
  validates_presence_of :experience
  validates_presence_of :qualification
  validates_presence_of :password
  def create_user
    @user = User.new
    @user.first_name = self.first_name
    @user.middle_name = self.middle_name
    @user.last_name = self.last_name
    @user.date_of_birth = self.date_of_birth
    @user.email = self.email
    @user.gender = self.gender
    @user.is_admin = 0
    @user.user_determin_id = self.id
    @user.user_determin_type = "doctor"
    @user.encrypted_password = self.encrypted_password
    @user.save
  end
  
  def change_user_password
    user.encrypted_password = self.encrypted_password
    user.save
  end
  
  private
  def encrypt_password
    unless self.password.blank?
      self.encrypted_password= Digest::SHA1.hexdigest(self.password)
      self.password = nil
    end
    return true
  end
end
