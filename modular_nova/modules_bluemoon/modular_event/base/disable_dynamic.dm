/datum/controller/subsystem/dynamic/OnConfigLoad()
	. = ..()
	if(CONFIG_GET(flag/force_extended))
		force_extended()

/datum/communciations_controller/send_roundstart_report()
	if(!CONFIG_GET(flag/force_extended))
		return ..()
