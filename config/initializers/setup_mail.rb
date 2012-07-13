ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {  
  :address              => "smtpout.secureserver.net",  
  :port                 => 80,  
  :domain               => "www.volunteerhours.org",  
  :user_name            => "info@volunteerhours.org",  
  :password             => "password",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
ActionMailer::Base.default_url_options[:host] = "localhost:3000" 