/datum/controller/subsystem/dynamic/New()
	. = ..()
	if(CONFIG_GET(flag/forced_extended))
		force_extended()

/datum/communciations_controller/send_roundstart_report()
	if(!CONFIG_GET(flag/forced_extended))
		return ..()
