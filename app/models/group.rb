class Group < ActiveRecord::Base
  attr_accessible :description, :name, :tags, :photo,:address,:email,:gamification,:gold,:silver,:bronze
geocoded_by :address
after_validation :geocode, :if => :address_changed?
  has_attached_file :photo
  has_many :sent_invitations, :class_name => "Invitation",:foreign_key=> 'sender_id'
  validates :description, presence: true
  validates :name , presence: true ,length:{maximum:50}
   validates :tags, presence: true
   validates :user_id ,presence:true
  has_many :users  , :through => :memberships
    audited 
  has_associated_audits

 has_many :memberships, foreign_key:"group_id" ,dependent: :destroy
  has_many :reverse_relationships, foreign_key:"user_id",dependent: :destroy, class_name:"memberships"
 has_many :events
end
