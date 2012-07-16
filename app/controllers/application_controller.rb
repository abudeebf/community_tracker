class ApplicationController < ActionController::Base
  protect_from_forgery except: :confirm_participants
 include SessionsHelper
 private

def current_user2
  @current_user2 ||= User.find(session[:Reflector_id]) if session[:Reflector_id]
end
helper_method :current_user2
end
