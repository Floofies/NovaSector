/datum/quirk/overweight
	name = "Overweight"
	desc = "You weigh more than an average person at your size, you've gotten used to it by now."
	gain_text = span_notice("Your body feels heavy.")
	lose_text = span_notice("Your suddenly feel lighter!")
	value = 0
	icon = FA_ICON_HAMBURGER // I'm very hungry. Give me the burger!
	medical_record_text = "Patient weighs higher than average."
	mob_trait = TRAIT_FAT

/datum/quirk/overweight/add(client/client_source)
	quirk_holder.add_movespeed_modifier(/datum/movespeed_modifier/overweight)

/datum/quirk/overweight/remove()
	quirk_holder.remove_movespeed_modifier(/datum/movespeed_modifier/overweight)

/datum/movespeed_modifier/overweight
	multiplicative_slowdown = 0.5 //Around that of a dufflebag, enough to be impactful but not debilitating.

/datum/mood_event/fat/New(mob/parent_mob, ...)
	. = ..()
	if(HAS_TRAIT_FROM(parent_mob, TRAIT_FAT, QUIRK_TRAIT))
		mood_change = 0 // They are probably used to it, no reason to be viscerally upset about it.
		description = "<b>I'm fat.</b>"
