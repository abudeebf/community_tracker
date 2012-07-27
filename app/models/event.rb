class Event < ActiveRecord::Base
  attr_accessible :category, :description, :endtime, :location, :starttime, :title,:photo, :recurring, :recurring_ends
  validates :title, presence: true,length:{maximum:50}
  validates :description, presence: true
  validates :category, presence:true
  validates :location, presence:true
   validates :user_id , presence: true 
   validates :group_id , presence: true
   
  validate :dateValidation?
    
  belongs_to :user
  belongs_to :group
  default_scope order: 'events.created_at DESC'
   has_attached_file :photo
   has_many :users, :through => :participations
  has_many :participations, foreign_key:"event_id" ,dependent: :destroy
  has_associated_audits
  audited
  
  def deliver
    sleep 10
  end

  def dateValidation?
    if endtime<starttime || starttime<DateTime.now.in_time_zone("Eastern Time (US & Canada)") 
      # logger.info("****" +endtime.in_time_zone("Eastern Time (US & Canada)"))
      # logger.info("****"+starttime)
      # logger.info("****"+DateTime.now)
      errors.add(:starttime, 'Error with the date. Please fix it!')
    end
  end
end
