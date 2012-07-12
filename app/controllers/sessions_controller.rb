class SessionsController < ApplicationController
	def new

	end
  def mobile_signin
   @correct=false
   puts " {  email: #{params[:email]} password: #{params[:password]}"
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
     @correct={signin: true}
    else
   @correct={signin: false}
   end
      respond_to do |format|
      format.json { render json: @correct }
    end
  end
	def create
    if !params[:provider].nil?
       user=Reflector.from_omniauth(env["omniauth.auth"])
    session[:reflector_id]=user.id
  # redirect_to root_url
    else
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
  end

	def destroy
    sign_out
    redirect_to root_path
   # session[:reflecotr_id]=nil
   # redirect_to root_path
	end
  

end
