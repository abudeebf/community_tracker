class UserMailer < ActionMailer::Base
 default :from => "info@volunteerhours.org"  
  
  def registration_confirmation(user) 
     @user = user  
    mail(:to => user.email, :subject => "Registered")  
  end  
  def password_reset(user)
  	@user=user
  	mail(:to => user.email, :subject => "Password reset")  
end
def invitation(invitation, signup_url,group)
	@group=group
  @signup_url=signup_url
  mail(:to => invitation, :subject => "Invitation")  
end
 def join_event(event,url,user)
  @event=event
  @group=Group.find(@event.group_id)
    @user=user
    @event_url=url
    mail(:to =>@user.email,:subject => "please join this event")
end
def update_hourtracker(user,url)
  @user=user
  @url=url
  mail(:to =>@user.email,:subject => "your volunteer hours have changed")
  end

  def pastEventConfirmation(pastevent)
    @pastevent=pastevent
    @user = User.find(pastevent.user_id)
    mail(:to =>@pastevent.email,:subject => "Please approve my volunteer hours @ www.volunteerhours.org")
  end
  def recurringeventemail(event,url,user)
    @event=event
    @group=Group.find(@event.group_id)
    @user=user
    @event_url=url
    mail(:to =>@user.email,:subject => "Please join this recurring event")
  end

end


