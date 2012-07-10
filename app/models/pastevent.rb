class Pastevent < ActiveRecord::Base
  attr_accessible :adminname, :approval, :email, :hours, :location, :orgname, :user_id
  belongs_to :user
end
