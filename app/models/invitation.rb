class Invitation < ActiveRecord::Base
  attr_accessible :invited_members, :sender_id, :sent_at ,:token
  belongs_to :sender, :class_name =>'Group'
  has_many :recipient, :class_name =>'User'
  validates_presence_of :invited_members
  validate :recipient_is_not_registered
     audited :associated_with =>:sender



  # before_create :generate_token

 private
 def recipient_is_not_registered
 	errors.add :invited_members, 'is already registered' if User.find_by_email(invited_members)
 		
 	end
 	# def generate_token
 	# 	self.token=Digest::SHA1.hexdigest([Time.now,rand].join)
 	# end

end

