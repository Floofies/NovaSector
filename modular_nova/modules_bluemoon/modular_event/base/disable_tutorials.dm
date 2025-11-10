/datum/tutorial_manager/should_run(mob/user)
	if(CONFIG_GET(flag/disable_tutorial))
		return FALSE
	return ..()
