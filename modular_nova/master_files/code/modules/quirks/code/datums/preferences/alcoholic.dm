/datum/preference/choiced/alcoholic
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "alcoholic"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/alcoholic/New()
	for(var/obj/item/reagent_containers/cup/glass/bottle/addiction as anything in GLOB.possible_alcoholic_addictions)
		GLOB.possible_alcoholic_addictions -= addiction
		GLOB.possible_alcoholic_addictions[addiction::name] = addiction

	return ..()

/datum/preference/choiced/alcoholic/init_possible_values()
	return list("Random") + assoc_to_keys(GLOB.possible_alcoholic_addictions)

/datum/preference/choiced/alcoholic/create_default_value()
	return "Random"

/datum/preference/choiced/alcoholic/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Alcoholic" in preferences.all_quirks

/datum/preference/choiced/alcoholic/apply_to_human(mob/living/carbon/human/target, value)
	return
