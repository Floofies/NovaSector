/datum/preference/choiced/junkie
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "junkie"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/smoker/New()
	for(var/datum/reagent/addiction as anything in GLOB.possible_junkie_addictions)
		GLOB.possible_junkie_addictions -= addiction
		GLOB.possible_junkie_addictions[addiction::name] = addiction

	return ..()

/datum/preference/choiced/junkie/init_possible_values()
	return list("Random") + assoc_to_keys(GLOB.possible_junkie_addictions)

/datum/preference/choiced/junkie/create_default_value()
	return "Random"

/datum/preference/choiced/junkie/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Junkie" in preferences.all_quirks

/datum/preference/choiced/junkie/apply_to_human(mob/living/carbon/human/target, value)
	return
