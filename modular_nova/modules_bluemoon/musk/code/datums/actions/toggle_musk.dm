/datum/action/toggle_musk
	name = "Toggle Musk"
	desc = "Toggle the intensity of your musky scents."
	button_icon = 'icons/effects/particles/smoke.dmi'
	button_icon_state = "steam_cloud_1"
	show_to_observers = FALSE

// Toggles the musk status effect and its intensity together
/datum/action/toggle_musk/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/human_owner = owner
	human_owner.cycle_musk_effect()
