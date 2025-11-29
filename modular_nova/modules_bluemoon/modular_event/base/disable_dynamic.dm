/datum/controller/subsystem/dynamic/OnConfigLoad()
	. = ..()
	if(CONFIG_GET(flag/force_extended))
		force_extended()
		admin_disabled_rulesets |= subtypesof(/datum/dynamic_ruleset)
		antag_events_enabled = FALSE

/datum/communciations_controller/send_roundstart_report()
	if(!CONFIG_GET(flag/force_extended))
		return ..()
