/datum/preference/choiced/smoker
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "smoker"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/smoker/New()
	for(var/obj/item/storage/fancy/cigarettes/addiction as anything in GLOB.possible_smoker_addictions)
		GLOB.possible_smoker_addictions -= addiction
		GLOB.possible_smoker_addictions[addiction::name] = addiction

	return ..()

/datum/preference/choiced/smoker/init_possible_values()
	return list("Random") + assoc_to_keys(GLOB.possible_smoker_addictions)

/datum/preference/choiced/smoker/create_default_value()
	return "Random"

/datum/preference/choiced/smoker/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Smoker" in preferences.all_quirks

/datum/preference/choiced/smoker/apply_to_human(mob/living/carbon/human/target, value)
	return
