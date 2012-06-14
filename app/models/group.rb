class Group < ActiveRecord::Base
  attr_accessible :description, :name, :tags
  validates :description, presence: true
  validates :name , presence: true ,length:{maximum:50}
   validates :tags, presence: true

end
