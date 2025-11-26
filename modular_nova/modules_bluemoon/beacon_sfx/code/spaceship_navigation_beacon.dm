// Bluemoon edit - Sound effects for beacons
/obj/machinery/spaceship_navigation_beacon
	var/datum/looping_sound/beacon_sfx/soundloop

/obj/machinery/spaceship_navigation_beacon/Initialize(mapload)
	. = ..()
	soundloop = new(src, !locked)

/obj/machinery/spaceship_navigation_beacon/emp_act(severity)
	. = ..()
	soundloop.stop()

/obj/machinery/spaceship_navigation_beacon/multitool_act_secondary(mob/living/user, obj/item/tool)
	. = ..()
	if(locked)
		soundloop.stop()
	else
		soundloop.start()
