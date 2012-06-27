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
end 
