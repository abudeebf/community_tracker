class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :gender, :last_name, :password
end
