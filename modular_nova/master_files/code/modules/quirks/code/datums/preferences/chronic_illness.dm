/datum/preference/choiced/chronic_illness
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "chronic_illness"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/chronic_illness/New()
	for(var/datum/disease/illness as anything in GLOB.possible_chronic_illness)
		GLOB.possible_chronic_illness -= illness
		GLOB.possible_chronic_illness[illness::name] = illness
	
	return ..()

/datum/preference/choiced/chronic_illness/init_possible_values()
	return list("Random") + assoc_to_keys(GLOB.possible_chronic_illness)

/datum/preference/choiced/chronic_illness/create_default_value()
	return "Random"

/datum/preference/choiced/chronic_illness/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Chronic Illness" in preferences.all_quirks

/datum/preference/choiced/chronic_illness/apply_to_human(mob/living/carbon/human/target, value)
	return
