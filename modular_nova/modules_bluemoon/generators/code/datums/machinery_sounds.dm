// Bluemoon edit - Quiet supermatter shard
/datum/looping_sound/supermatter/shard
	volume = 20
	extra_range = 0
	falloff_exponent = 6.6
	falloff_distance = 3

// Bluemoon addition - Custom generator sounds
/datum/looping_sound/turbine
	start_sound = 'modular_nova/modules_bluemoon/generators/sound/turbine_spinup.ogg'
	start_length = 4.7 SECONDS
	mid_sounds = list(
		'modular_nova/modules_bluemoon/generators/sound/turbine_run1.ogg' = 1,
		'modular_nova/modules_bluemoon/generators/sound/turbine_run2.ogg' = 1,
		'modular_nova/modules_bluemoon/generators/sound/turbine_run3.ogg' = 1,
	)
	mid_length = 1.1 SECONDS
	end_sound = 'modular_nova/modules_bluemoon/generators/sound/turbine_spindown.ogg'
	volume = 75
	in_order = TRUE

/datum/looping_sound/generator/portable
	start_sound = 'modular_nova/modules_bluemoon/generators/sound/generator_start.ogg'
	start_length = 5.2 SECONDS
	mid_sounds = list('modular_nova/modules_bluemoon/generators/sound/generator_run.ogg' = 1)
	mid_length = 5.1 SECONDS
	end_sound = 'modular_nova/modules_bluemoon/generators/sound/generator_stop.ogg'
	in_order = TRUE
