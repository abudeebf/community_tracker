class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :password, :password_confirmation
  has_secure_password
  has_many :groups, :through => :memberships
  has_many :events , dependent: :destroy
  has_many :memberships, foreign_key:"user_id" ,dependent: :destroy
  has_many :reverse_relationships, foreign_key:"group_id",dependent: :destroy, class_name:"memberships"
  before_save {|user|user.email=user.email.downcase}
  before_create :create_remember_token 
  validates_presence_of :first_name ,:message =>" is required",length:{maximum:12}
  validates_presence_of :last_name ,:message =>" is required",length:{maximum:10}
   validates_presence_of :email,:message => " is required"
  validates_presence_of :password_confirmation ,:on => :create
  validates_presence_of :gender , :message  => " is required"
 validates_format_of  :password, :with => /((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,20})/, :message => " dose not meet password requirment",:on => :create
  validates_format_of  :email, :with => /\b[A-Za-z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/
  validates :email, uniqueness: {case_senstive: false}
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at=Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
  end
  def joingroup!(group,member)
    memberships.create!(user_id:self.id,group_id:group,member:member)
  end
  def hasgroup?(group)
    memberships.find_by_group_id(group.id)
  end
  def unjoingroup!(group)
   memberships.find_by_group_id(group.id).destroy
  end

  private
 def create_remember_token
    self.remember_token=SecureRandom.urlsafe_base64
  end
  def generate_token(column)
    begin
    self[column]=SecureRandom.urlsafe_base64
  end while User.exists?(column=>self[column])
  end
end
