class Participation < ActiveRecord::Base
  attr_accessible :approval, :end_time, :event_id, :start_time, :user_id,:attend
  belongs_to :user
  belongs_to :event
end
