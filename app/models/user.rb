require 'digest/sha1'
class User < ActiveRecord::Base
  belongs_to :user_determin , :polymorphic => true
  validates_presence_of :first_name
  validates_presence_of :middle_name
  validates_presence_of :last_name
  validates_presence_of :date_of_birth
  validates_presence_of :email
  validates_presence_of :gender
  
  def role_symbols
    user_determin_type.present? ? [user_determin_type.to_sym] : []
  end
  
  def self.create_user(type)
    @user = User.new(:first_name=>type.first_name,:middle_name => type.middle_name,
      :last_name => type.last_name,:date_of_birth => type.date_of_birth,
      :email => type.email,:gender => type.gender,:is_admin => 0,:address=>type.address,
      :user_determin_id => type.id,:user_determin_type => type.class.to_s,
      :contact_number => type.contact_number,:encrypted_password => type.encrypted_password)
  @user.save
  end
  
  def self.encrypt_password(pswd)
    if pswd.new_record?
    pswd.password = pswd.first_name.downcase+"123" 
    end
    pswd.encrypted_password= Digest::SHA1.hexdigest(pswd.password)
    pswd.password = nil
    return true
  end

  def self.authenticated?(username , password)
      pwd = Digest::SHA1.hexdigest(password.to_s)
    find_by_first_name_and_encrypted_password(username,pwd)
  end
   
end
