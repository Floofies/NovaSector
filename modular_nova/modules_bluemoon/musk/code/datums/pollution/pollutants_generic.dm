/datum/pollutant/musk
	name = "musk"
	scent = "a bodily musk"
	descriptor = "pungent scent"
	pollutant_flags = POLLUTANT_SMELL
	smell_intensity = 5
	alpha = 0

// Developer basetype for creation of subtypes
/datum/pollutant/musk/effect
	name = "special musk"
	scent = "a bodily musk with special effects"
	descriptor = "change this"
	pollutant_flags = POLLUTANT_SMELL | POLLUTANT_TOUCH_ACT

/datum/pollutant/musk/effect/touch_act(mob/living/carbon/victim, amount)
	if(isnull(victim.client) || !victim.client?.prefs?.read_preference(/datum/preference/toggle/erp) || !victim.client?.prefs?.read_preference(/datum/preference/toggle/erp/musk))
		return FALSE
	if(HAS_TRAIT(victim, TRAIT_ANOSMIA))
		return FALSE
	if(!isnull(victim.internal) || !isnull(victim.external))
		return FALSE
	return TRUE

/datum/pollutant/musk/effect/aphrodisiac
	name = "sexual musk"
	scent = "a sexual bodily musk"
	descriptor = "arousing scent"

/datum/pollutant/musk/effect/aphrodisiac/touch_act(mob/living/carbon/victim, amount)
	if(victim.has_quirk(/datum/quirk/olfactophile))
		astype(victim, /mob/living/carbon/human)?.adjust_arousal(0.1 * amount)

/datum/pollutant/musk/effect/hypnotic
	name = "hypnotic musk"
	scent = "a relaxing bodily musk"
	descriptor = "hypnotic scent"
	pollutant_flags = POLLUTANT_SMELL | POLLUTANT_TOUCH_ACT

/datum/pollutant/musk/effect/hypnotic/touch_act(mob/living/carbon/victim, amount)
	if(!..())
		return
	if(amount < 10)
		return
	var/hypno_pref = victim.client.prefs.read_preference(/datum/preference/choiced/erp_status_hypno)
	if(hypno_pref != "Always/Whenever" || hypno_pref != "Gameplay Only")
		return
	victim.apply_status_effect(/datum/status_effect/musky_relaxation, 5 MINUTES, FALSE)
	if(amount < 20)
		return
	victim.apply_status_effect(/datum/status_effect/trance, 30 SECONDS, FALSE)
