
class StaticPagesController < ApplicationController
	
  def home
   @events=Event.all
   @groups=Group.all
  end

  def aboutus
  end

  def stories
  end

  def signup
  end
end
