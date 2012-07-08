class UserMailer < ActionMailer::Base
 default :from => "info@communitytracker.com"  
  
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
  mail(:to =>@user.email,:subject => "your volnteer hours have changed")
  end
end


