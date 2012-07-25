ActionMailer::Base.smtp_settings = {    :address              => "smtp.gmail.com", 
   :port                 => 587,  
     :domain               => "communitytracker.com",
         :user_name            => "faabudeeb",    :password             => "Evilkathy5", 
            :authentication       => "plain",    :enable_starttls_auto => true  } 

         if Rails.env.production?
             ActionMailer::Base.default_url_options[:host] = "www.volunteerhours.org" 
         else
         	ActionMailer::Base.default_url_options[:host] = "localhost:3000" 
         end