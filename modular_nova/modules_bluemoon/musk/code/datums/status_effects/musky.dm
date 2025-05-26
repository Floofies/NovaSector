/atom/movable/screen/alert/status_effect/musky
	name = "Musky"
	desc = "You are emanating a rather.. unique.. scent."
	icon_state = "stoned"

/datum/status_effect/musky
	id = "musk"
	status_type = STATUS_EFFECT_UNIQUE
	duration = STATUS_EFFECT_PERMANENT
	tick_interval = 3 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/musky
	var/particles/add_particles = /particles/musk
	var/musk_intensity = 1
	var/musk_alpha = 54
	var/datum/pollutant/musk/musk_type = /datum/pollutant/musk

/datum/status_effect/musky/on_apply()
	. = ..()
	var/mob/living/carbon/human/human_owner = owner
	if(isnull(human_owner.client))
		return
	var/musk_pref_type = human_owner.client.prefs.read_preference(/datum/preference/choiced/musk_type)
	if(musk_pref_type != "Scent Only (Default)")
		switch(musk_pref_type)
			if("Sexual (Aphrodisiac)")
				musk_type = /datum/pollutant/musk/effect/aphrodisiac
			if("Relaxing (Hypnotic)")
				musk_type = /datum/pollutant/musk/effect/hypnotic
	//TODO: Add more musk types
	var/obj/effect/abstract/shared_particle_holder/particle_holder = owner.add_shared_particles(add_particles)
	var/musk_color = human_owner.client.prefs.read_preference(/datum/preference/color/musk_color)
	particle_holder.particles.color = "[musk_color][musk_alpha]"

/datum/status_effect/musky/on_remove()
	owner.remove_shared_particles(add_particles)

/datum/status_effect/musky/tick(seconds_between_ticks)
	var/turf/musky_turf = get_turf(owner)
	musky_turf.pollute_turf(musk_type, musk_intensity * seconds_between_ticks)

// More intense visuale effect
/datum/status_effect/musky/strong
	add_particles = /particles/musk/strong
	musk_intensity = 3
	musk_alpha = 23

/datum/status_effect/musky_relaxation
	id = "musk_relaxed"
	status_type = STATUS_EFFECT_UNIQUE
	tick_interval = STATUS_EFFECT_NO_TICK
	duration = 60 SECONDS
	alert_type = null

/datum/status_effect/musky_relaxation/on_apply()
	. = ..()
	if(isnull(owner.client))
		return
	to_chat(owner, span_hypnophrase("The musky scent makes you feel oddly relaxed..."))
