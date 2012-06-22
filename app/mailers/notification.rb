class Notification < ActionMailer::Base
 def registration_confirmation(user)
 	recipients user.email
 	from "webmaster@community.com"
 	subject "Thank you for Registrering"
 	body :user=> user
 end
end
