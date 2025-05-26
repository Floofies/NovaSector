/datum/quirk/musky
	name = "Musky"
	desc = "Your body emanates a customizable scent. Olfactophiles will receive special effects."
	value = 0
	gain_text = span_userlove("You smell a musky scent coming from yourself...")
	lose_text = span_notice("Your body's musky scent fades away!")
	quirk_flags = QUIRK_HUMAN_ONLY | QUIRK_PROCESSES | QUIRK_HIDE_FROM_SCAN
	icon = FA_ICON_PEPPER_HOT
	erp_quirk = TRUE

/datum/quirk/musky/add(client/client_source)
	var/datum/action/toggle_musk/musk_action = new
	musk_action.Grant(quirk_holder)

/datum/quirk/musky/remove()
	var/datum/action/action_to_remove = locate(/datum/action/toggle_musk) in quirk_holder.actions
	if(action_to_remove)
		qdel(action_to_remove)

/datum/quirk_constant_data/musky
	associated_typepath = /datum/quirk/musky
	customization_options = list(
		/datum/preference/choiced/musk_type,
		/datum/preference/color/musk_color,
	)
