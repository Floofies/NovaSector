#define DEFAULT_MUSK_TYPE "Scent Only (Default)"

/datum/preference/toggle/erp/musk
	savefile_key = "musk_pref"

/datum/preference/choiced/musk_type
	savefile_key = "musk_type"
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE

/datum/preference/choiced/musk_type/apply_to_human()
	return

/datum/preference/choiced/musk_type/create_default_value()
	return DEFAULT_MUSK_TYPE

/datum/preference/choiced/musk_type/init_possible_values()
	return list(
		DEFAULT_MUSK_TYPE,
		"Sexual (Aphrodisiac)",
		"Relaxing (Hypnotic)",
	)

/datum/preference/color/musk_color
	savefile_key = "musk_color"
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE

/datum/preference/color/musk_color/apply_to_human()
	return

/datum/preference/color/musk_color/create_default_value()
	return "#ffffff"

#undef DEFAULT_MUSK_TYPE
