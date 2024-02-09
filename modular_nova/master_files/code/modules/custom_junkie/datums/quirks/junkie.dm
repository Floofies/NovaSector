/datum/quirk/item_quirk/junkie/add_unique(client/client_source)
	if(type != /datum/quirk/item_quirk/junkie)
		return ..()

	var/addiction = client_source?.prefs.read_preference(/datum/preference/choiced/junkie)
	if(!addiction || (addiction == "Random"))
		return ..()

	reagent_type = GLOB.possible_junkie_addictions[addiction]
	..()

/datum/quirk_constant_data/junkie
	associated_typepath = /datum/quirk/item_quirk/junkie
	customization_options = list(/datum/preference/choiced/junkie)
