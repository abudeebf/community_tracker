class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :password, :password_confirmation
  has_many :groups
  has_secure_password
  before_save {|user|user.email=user.email.downcase}
  before_save :create_remember_token 
  validates_presence_of :first_name ,:message =>" is required",length:{maximum:12}
  validates_presence_of :last_name ,:message =>" is required",length:{maximum:10}
   validates_presence_of :email,:message => " is required"
  validates_presence_of :password_confirmation ,:message  => " is required"
  validates_presence_of :gender , :message  => " is required"
   validates_format_of  :password, :with => /((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,20})/, :message => " dose not meet password requirment"
  validates_format_of  :email, :with => /\b[A-Za-z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/
  validates :email, uniqueness: {case_senstive: false}
  def create_remember_token
    self.remember_token=SecureRandom.urlsafe_base64
  end
end
