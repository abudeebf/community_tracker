class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :password
  attr_accessible :email, :first_name, :gender, :last_name, :password
  validates_presence_of :first_name ,:message =>" is required"
  validates_presence_of :last_name ,:message =>" is required"
   validates_presence_of :email,:message => " is required"
  validates_presence_of :password,:message  => " is required"
  validates_presence_of :gender , :message  => " is required"
   validates_format_of  :password, :with => /((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%]).{6,20})/, :message => " dose not meet password requirment"
  validates_format_of  :email, :with => /\b[A-Za-z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/ , message: " is not correct"

end
