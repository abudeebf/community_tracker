class Event < ActiveRecord::Base
  attr_accessible :category, :description, :endtime, :location, :starttime, :title
end
