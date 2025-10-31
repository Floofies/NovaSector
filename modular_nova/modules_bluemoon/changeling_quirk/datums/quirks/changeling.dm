/datum/quirk/changeling
	name = "Changeling"
	desc = "You're a member of the Changeling Hive, a species of alien predator that is capable of shapeshifting. You have a stinger and can synthesize deadly chemicals internally. All Changelings are linked together through a hivemind."
	icon = FA_ICON_SPAGHETTI_MONSTER_FLYING
	value = 0
	medical_record_text = ""
	quirk_flags = QUIRK_HIDE_FROM_SCAN
	nova_stars_only = TRUE

/datum/quirk/changeling/add_unique(client/client_source)
	var/datum/mind/target_mind = quirk_holder.mind
	var/datum/antagonist/changeling/quirk/changeling_datum = target_mind.has_antag_datum(/datum/antagonist/changeling/quirk)
	if(isnull(changeling_datum))
		changeling_datum = target_mind.add_antag_datum(/datum/antagonist/changeling/quirk)
		LAZYADD(target_mind.special_roles, ROLE_CHANGELING)

/datum/quirk/changeling/remove(client/client_source)
	var/datum/mind/target_mind = quirk_holder.mind
	if(isnull(target_mind))
		return
	var/datum/antagonist/changeling/quirk/changeling_datum = target_mind.has_antag_datum(/datum/antagonist/changeling/quirk)
	if(!isnull(changeling_datum))
		target_mind.remove_antag_datum(/datum/antagonist/changeling/quirk)

		LAZYREMOVE(target_mind.special_roles, ROLE_CHANGELING)

/datum/quirk/changeling/is_species_appropriate(datum/species/mob_species)
	if (ispath(mob_species, /datum/species/synthetic))
		return FALSE
	if (ispath(mob_species, /datum/species/jelly))
		return FALSE
	if (ispath(mob_species, /datum/species/plasmaman))
		return FALSE
	if (ispath(mob_species, /datum/species/ethereal))
		return FALSE
	return ..()
