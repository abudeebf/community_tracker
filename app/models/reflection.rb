class Reflection < ActiveRecord::Base
  attr_accessible :r_id, :u_reflection
  belongs_to :participations
   validates :r_id, presence: true
  validates :u_reflection, presence: true
  validates :r_id, uniqueness: {case_senstive: false} 
end
