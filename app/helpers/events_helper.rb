module EventsHelper

	def eventExpire?(event)
		return event.starttime > DateTime.now.in_time_zone("Eastern Time (US & Canada)")
	end
end
