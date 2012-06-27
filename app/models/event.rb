class Event < ActiveRecord::Base
  attr_accessible :category, :description, :endtime, :location, :starttime, :title,:photo
  validates :title, presence: true,length:{maximum:50}
  validates :description, presence: true
  validates :category, presence:true
  validates :location, presence:true
   validates :user_id , presence: true 
   validates :group_id , presence: true
  belongs_to :user
  belongs_to :group
  default_scope order: 'events.created_at DESC'
   has_attached_file :photo
   has_many :users, :through => :participations
  has_many :participations, foreign_key:"event_id" ,dependent: :destroy
end
