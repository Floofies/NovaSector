// Bluemoon edit - Sound effects for beacons
/obj/item/gps/computer
	var/datum/looping_sound/beacon_sfx/soundloop

/obj/item/gps/computer/Initialize(mapload)
	soundloop = new(src, tracking_on)
	. = ..()

// Toggle the soundloop off when the beacon is disabled
/datum/component/gps/item/toggletracking(mob/user)
	..()
	var/obj/item/gps/computer/parent_beacon = parent
	if(!istype(parent_beacon))
		return
	if(isnull(parent_beacon.soundloop))
		return
	if(tracking)
		parent_beacon.soundloop.start()
	else
		parent_beacon.soundloop.stop()

