/mob/living
	///Indicates to [/mob/living/verb/toggle_musk()] which status effect to use
	var/musk_intensity = FALSE

/mob/living/Initialize(mapload)
	. = ..()
	if(CONFIG_GET(flag/disable_erp_preferences))
		verbs -= /mob/living/verb/toggle_musk

/mob/living/carbon/hypnosis_vulnerable()
	if(!isnull(client) && has_status_effect(/datum/status_effect/musky_relaxation))
		var/hypno_pref = client.prefs.read_preference(/datum/preference/choiced/erp_status_hypno)
		if(hypno_pref == "Always/Whenever" || hypno_pref == "Gameplay Only")
			return TRUE
	return ..()

/mob/living/proc/cycle_musk_effect()
	var/datum/status_effect/musky/musk_status = has_status_effect(/datum/status_effect/musky)
	if(isnull(musk_status))
		toggle_musk_effect()
	else if(istype(musk_status, /datum/status_effect/musky/strong))
		toggle_musk_effect()
		musk_intensity = FALSE
	else
		toggle_musk_intensity()

/mob/living/proc/toggle_musk_effect()
	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp) || !client?.prefs?.read_preference(/datum/preference/toggle/erp/musk))
		return

	var/datum/status_effect/musky/musk_status = has_status_effect(/datum/status_effect/musky)
	if(isnull(musk_status))
		if(musk_intensity)
			apply_status_effect(/datum/status_effect/musky/strong)
		else
			apply_status_effect(/datum/status_effect/musky)
		balloon_alert(src, "musk enabled")
		to_chat(src, span_notice("You smell a[musk_intensity ? " strong" : ""] musky scent coming from yourself..."))
		return

	balloon_alert(src, "musk disabled")
	to_chat(src, span_notice("Your musky scent subsides..."))
	if(musk_intensity)
		remove_status_effect(/datum/status_effect/musky/strong)
	else
		remove_status_effect(/datum/status_effect/musky)

/mob/living/proc/toggle_musk_intensity()
	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp) || !client?.prefs?.read_preference(/datum/preference/toggle/erp/musk))
		return

	var/datum/status_effect/musky/musk_status = has_status_effect(/datum/status_effect/musky)
	var/has_musk = !isnull(musk_status)
	if(has_musk)
		if(musk_intensity)
			remove_status_effect(/datum/status_effect/musky/strong)
		else
			remove_status_effect(/datum/status_effect/musky)
	musk_intensity = !musk_intensity
	if(musk_intensity)
		balloon_alert(src, "musk increased")
	else
		balloon_alert(src, "musk reduced")
	if(has_musk)
		if(musk_intensity)
			apply_status_effect(/datum/status_effect/musky/strong)
		else
			apply_status_effect(/datum/status_effect/musky)
