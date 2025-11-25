/obj/docking_port/mobile
	/// The basetype of all shuttle areas
	/// Used by play_engine_sound to quickly check area type
	var/area/shuttle_area_basetype
	/// The sound to be played after takeoff
	var/sound/after_takeoff_sound
	/// Volume used by area-based play_engine_sound
	var/takeoff_sound_volume = 50

// Bluemoon edit - Play hyperspace takeoff sound from shuttle areas
/obj/docking_port/mobile/play_engine_sound(atom/distant_source, takeoff, takeoff_phase)
	// Fallback to proximity sound on stationary port, or if basetypes aren't filled in
	if((distant_source != src) || isnull(shuttle_area_basetype))
		return ..()
	var/selected_sound = takeoff_sound
	if(takeoff_phase == SHUTTLE_IGNITING)
		selected_sound = after_takeoff_sound
	else if (takeoff_phase == SHUTTLE_CALL)
		selected_sound = landing_sound
	for(var/mob/target_mob as anything in SSmobs.clients_by_zlevel[z])
		if(!istype(get_area(target_mob), shuttle_area_basetype))
			continue
		target_mob.playsound_local(
			turf_source = get_turf(target_mob),
			soundin = selected_sound,
			vol = takeoff_sound_volume,
			vary = FALSE,
			use_reverb = FALSE,
			volume_preference = /datum/preference/numeric/volume/sound_ship_ambience_volume
		)
