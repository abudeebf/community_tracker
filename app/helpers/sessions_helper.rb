module SessionsHelper
	def sign_in (user)
		# sign the user in
       cookies[:remember_token]={value:user.remember_token, expires:20.years.from_now}
       self.current_user = user
       end
       def signed_in?
         !current_user.nil?
       end
       def current_user=(user)
       	@current_user=user
       end
       def sign_out
              current_user=nil
              cookies.delete(:remember_token)
       end
       def current_user
       	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
       end

end
