/datum/tutorial_manager/should_run(mob/user)
	if(CONFIG_GET(/datum/config_entry/flag/tutorial_disabled))
		return FALSE
	return ..()
