module GroupsHelper
	def grouphourtracker1(events)
		sum=0
	   events.each { |event|
	 	x=event.participations
	 	x.each { |y| if(y.approval && y.attend)
         sum += (y.end_time.to_f-y.start_time.to_f)
         end
}         
	 	}
	 	return sum/3600
	end
end
