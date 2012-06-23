class Group < ActiveRecord::Base
  attr_accessible :description, :name, :tags, :photo
  has_attached_file :photo
  validates :description, presence: true
  validates :name , presence: true ,length:{maximum:50}
   validates :tags, presence: true
  has_many :users  , :through => :memberships
 has_many :memberships, foreign_key:"group_id" ,dependent: :destroy
  has_many :reverse_relationships, foreign_key:"user_id",dependent: :destroy, class_name:"memberships"
end
