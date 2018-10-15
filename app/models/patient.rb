class Patient < ActiveRecord::Base
  attr_accessor :password
  validates_presence_of :first_name
  validates_presence_of :middle_name
  validates_presence_of :last_name
  validates_presence_of :date_of_birth
  validates_presence_of :email
  validates_presence_of :gender
  validates_presence_of :address
  validates_presence_of :blood_group
  validates_presence_of :password
  before_save :encrypt_password
  has_one :user , :as => :user_determin
  has_many :appointments
  has_many :doctors , :through => :appointments
  has_many :doctor_sugggested_patient
  has_one :patient_to_bed
  has_one :bed , :through => :doctor_sugggested_patient
  after_create :create_user
  after_save :change_user_password , :if => Proc.new{|p| !p.new_record? and  p.encrypted_password_changed?}
  
  
  def create_user
    @user = User.find_or_create_by_user_determin_id(self.id)
    @user.first_name = self.first_name
    @user.middle_name = self.middle_name
    @user.last_name = self.last_name
    @user.date_of_birth = self.date_of_birth
    @user.email = self.email
    @user.gender = self.gender
    @user.is_admin = 0
    @user.user_determin_id = self.id
    @user.user_determin_type = "patient"
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
