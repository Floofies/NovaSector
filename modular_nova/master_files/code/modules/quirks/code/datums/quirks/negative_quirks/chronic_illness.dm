/datum/quirk/item_quirk/chronic_illness
	var/datum/disease/illness

/datum/quirk/item_quirk/chronic_illness/add_unique(client/client_source)
	var/picked_illness = client_source?.prefs.read_preference(/datum/preference/choiced/chronic_illness)
	if(!picked_illness || (picked_illness == "Random"))
		picked_illness = pick(GLOB.possible_chronic_illness)

	var/datum/disease/picked_disease = GLOB.possible_chronic_illness[picked_illness]
	illness = new picked_disease()
	illness.cure_text = ""
	illness.spread_text = ""
	illness.cure_chance = 0
	illness.severity = DISEASE_SEVERITY_UNCURABLE
	illness.spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS
	illness.disease_flags = CHRONIC

	quirk_holder.ForceContractDisease(illness)

	// TODO: Match up meds
	give_item_to_holder(/obj/item/storage/pill_bottle/sansufentanyl, list(LOCATION_BACKPACK = ITEM_SLOT_BACKPACK),flavour_text = "You've been provided with medication to help manage your condition. Take it regularly to avoid complications.")
	give_item_to_holder(/obj/item/healthanalyzer/simple/disease, list(LOCATION_BACKPACK = ITEM_SLOT_BACKPACK))

/datum/quirk/item_quirk/chronic_illness/remove()
	if(illness)
		illness.severity = DISEASE_SEVERITY_HARMFUL
		illness.cure(add_resistance = FALSE)

/datum/quirk_constant_data/chronic_illness
	associated_typepath = /datum/quirk/item_quirk/chronic_illness
	customization_options = list(/datum/preference/choiced/chronic_illness)
