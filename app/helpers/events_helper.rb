module EventsHelper

	def eventExpire?(event)
		return event.starttime > DateTime.now
	end
end
