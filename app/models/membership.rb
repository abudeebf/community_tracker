class Membership < ActiveRecord::Base
  attr_accessible :group_id, :member,:user_id
  belongs_to :group
  belongs_to :user
  validates :user_id , presence: true
  validates :group_id ,presence: true
  
end
