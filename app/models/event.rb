class Event < ActiveRecord::Base
  attr_accessible :category, :description, :endtime, :location, :starttime, :title
  validates :title, presence: true,length:{maximum:50}
  validates :description, presence: true
  validates :category, presence:true
  validates :location, presence:true
  belongs_to :user
end
