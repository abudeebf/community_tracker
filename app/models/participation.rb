class Participation < ActiveRecord::Base
  attr_accessible :approval, :end_time, :event_id, :start_time, :user_id,:attend
  belongs_to :user
  belongs_to :event
  has_one :reflection ,foreign_key:"R_id" ,dependent: :destroy
  audited :associated_with =>:event
  audited :associated_with =>:user
  has_associated_audits
end
