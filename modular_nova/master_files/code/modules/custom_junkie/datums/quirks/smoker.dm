/datum/quirk/item_quirk/junkie/smoker/add_unique(client/client_source)
	var/addiction = client_source?.prefs.read_preference(/datum/preference/choiced/smoker)
	if(!addiction || (addiction == "Random"))
		return ..()

	drug_container_type = GLOB.possible_smoker_addictions[addiction]
	return ..()

/datum/quirk_constant_data/smoker
	associated_typepath = /datum/quirk/item_quirk/junkie/smoker
	customization_options = list(/datum/preference/choiced/smoker)
