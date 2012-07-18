module UsersHelper
	#Returns the Gravatar for the given user.
	def gravatar_for(user , no)
		gravatar_id=Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{no}"
		link_to image_tag(gravatar_url, alt:user.last_name,class:"gravatar"),"http://gravatar.com/emails", :target => "_blank"
	end
	
	def hourtracker1(user)
	 if (user.participations.nil?||user.participations.empty?) && (user.pastevents.nil? || user.pastevents.empty? )
	 	x="you did not particpate yet,please participate to activate your hour tracker"
	 else
	 	sum=0
	 	x=user.participations
	 	pastevents=user.pastevents
	 	x.each { |y| if y.approval && y.attend
         sum += (y.end_time.to_f-y.start_time.to_f)
          end
	 	}
	 	sum=sum/3600
	 	pastevents.each { |pastevent| 
		 	if pastevent.approval==true
		 		sum+=pastevent.hours 
			end
		}

	 	return sum
	 end
	end
	def badgefinder(group,hours)
		badge=""
	  if (hours>=group.gold)
	   badge="Gold"
	   elsif (hours>=group.silver)
		badge="Sliver"
	    elsif (hours>=group.bronze)
         badge="Bronze"
        else
   	     x= group.bronze-hours
   	    badge=  x.inspect + " hours to get a badge"
	end
	return badge
   end
end
