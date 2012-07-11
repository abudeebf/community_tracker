class PasswordResetsController < ApplicationController
  def new

  end
  def create
  	user=User.find_by_email(params[:email])
    if !user.nil?
  	user.send_password_reset 
  	redirect_to root_path,:notice =>"Email sent with password reset instrctions"
  else
       redirect_to new_password_reset_path, :alert => "Email not available";
    end
  end
 def edit
 	@user=User.find_by_password_reset_token!(params[:id])
 end
 def update
 @user = User.find_by_password_reset_token!(params[:id])
 regexp=/((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})/
 if regexp.match (params[:user][:password]) 
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password &crarr; 
      reset has expired."
      @user.audit_comment="reset password"
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Password has been reset."
    end
    else
      flash[:error]="password does not meet requirments"
      render :edit
    end
  end
end
