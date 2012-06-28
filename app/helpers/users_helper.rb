module UsersHelper
	#Returns the Gravatar for the given user.
	def gravatar_for(user , no)
		gravatar_id=Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{no}"
		link_to image_tag(gravatar_url, alt:user.last_name,class:"gravatar"),"http://gravatar.com/emails", :target => "_blank"
	end
	
	def hourtracker1(user)
	 if user.participations.nil? ||user.participations.empty?
	 	x="you did not particpate yet,please participate to activate your hour tracker"
	 else
	 	x=user.participations
	 	
	 end
	end

end
