class Pastevent < ActiveRecord::Base
  attr_accessible :adminname, :approval, :email, :hours, :location, :orgname, :disclamer, :start_date, :end_date
    validate :dateValidation?

  belongs_to :user
  
  validates_presence_of :adminname ,:message =>" is required"
  validates_presence_of :hours ,:message =>" is required and should be two digits",length:{maximum:2}
  validates_presence_of :email,:message => " is required"
  validates_presence_of :location ,:message =>"is required"
  validates_presence_of :orgname , :message  => " is required"
  validates_presence_of :user_id , :message  => " is required"
  validates_presence_of :disclamer , :message  => " is required"
  validates_format_of  :email, :with => /\b[A-Za-z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/
  

  def dateValidation?
    if end_date<start_date
      errors.add(:end_date, 'is smaller than start date. Please fix it!')
    elsif start_date>DateTime.now 
      errors.add(:start_date, 'should be a past date. Please fix it!')
    end
  end
end