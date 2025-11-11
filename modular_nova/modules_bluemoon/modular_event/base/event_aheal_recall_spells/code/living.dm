/mob/living/Login()
	. = ..()
	if(CONFIG_GET(flag/self_aheal))
		GRANT_ACTION(/datum/action/cooldown/aheal)
	if(CONFIG_GET(flag/self_summon))
		GRANT_ACTION(/datum/action/cooldown/spell/summonitem/event)

/mob/living/Logout()
	. = ..()
	if(CONFIG_GET(flag/self_aheal))
		var/datum/action/action_to_remove = locate(/datum/action/cooldown/aheal) in actions
		if(!isnull(action_to_remove))
			qdel(action_to_remove)
	if(CONFIG_GET(flag/self_summon))
		var/datum/action/action_to_remove = locate(/datum/action/cooldown/spell/summonitem/event) in actions
		if(!isnull(action_to_remove))
			qdel(action_to_remove)
