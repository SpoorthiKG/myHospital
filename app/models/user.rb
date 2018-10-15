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
  
  def self.authenticated?(username , password)
      pwd = Digest::SHA1.hexdigest(password.to_s)
    find_by_first_name_and_encrypted_password(username,pwd)
  end
   
end
