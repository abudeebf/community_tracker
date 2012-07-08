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
              session.delete(:return_to)

       end

       def current_user
       	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
       end

       def current_user?(user)
              user==current_user
       end

      def store_location 
       session[:return_to]=request.fullpath
     end

     def redirect_back_or(default)
    
       redirect_to(session[:return_to] || default)
       session.delete(:return_to)

        # to delete the session path after redirection
     end
     
    
     def signed_in_user
    store_location
    redirect_to signin_path, notice:"Please Sign in." unless signed_in?  
  end 
 
end
