/datum/quirk/item_quirk/junkie/alcoholic/add_unique(client/client_source)
	var/addiction = client_source?.prefs.read_preference(/datum/preference/choiced/alcoholic)
	if(!addiction || (addiction == "Random"))
		return ..()

	drug_container_type = GLOB.possible_alcoholic_addictions[addiction]
	return ..()

/datum/quirk_constant_data/alcoholic
	associated_typepath = /datum/quirk/item_quirk/junkie/alcoholic
	customization_options = list(/datum/preference/choiced/alcoholic)
