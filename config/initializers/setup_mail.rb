ActionMailer::Base.smtp_settings = {    :address              => "smtp.gmail.com", 
   :port                 => 587,  
     :domain               => "communitytracker.com",
         :user_name            => "faabudeeb",    :password             => "zorolove5", 
            :authentication       => "plain",    :enable_starttls_auto => true  } 
             ActionMailer::Base.default_url_options[:host] = "localhost:3000" 