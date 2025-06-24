/datum/map_template/shuttle/hedon
	port_id = "hedon"
	who_can_purchase = null
	suffix = "cruiser"
	name = "NTDS 'Hedon'"

/obj/docking_port/stationary/hedon
	name = "Refueling Station: Port 10"
	shuttle_id = "hedon_home"
	roundstart_template = /datum/map_template/shuttle/hedon
	height = 39
	width = 80
	dwidth = 1
	dheight = 25

/obj/docking_port/mobile/hedon
	callTime = 5 MINUTES
	can_move_docking_ports = TRUE
	shuttle_id = "hedon"
	launch_status = 0
	movement_force = list("KNOCKDOWN"=0,"THROW"=0)
	name = "NTDS 'Hedon'"
	port_direction = EAST
	preferred_direction = EAST

/obj/docking_port/mobile/hedon/Initialize(mapload)
	shuttle_areas = subtypesof(/area/shuttle/hedon)
	return ..()

/area/shuttle/hedon
	name = "NTDS 'Hedon'"
	requires_power = TRUE
	fire_detect = FALSE
	mood_bonus = 10
	mood_message = "I love partying on the Hedon!"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/shuttle/hedon/bar
	name = "NTDS 'Hedon' Bar"
	icon_state = "bar"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/shuttle/hedon/bathroom
	name = "NTDS 'Hedon' Bathroom"
	icon_state = "toilet"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/shuttle/hedon/boardroom
	name = "NTDS 'Hedon' Boardroom"
	icon_state = "meeting"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/shuttle/hedon/bridge
	name = "NTDS 'Hedon' Command Bridge"
	icon_state = "bridge"

/area/shuttle/hedon/diner
	name = "NTDS 'Hedon' Cafeteria"
	icon_state = "cafeteria"

/area/shuttle/hedon/engine
	name = "NTDS 'Hedon' Engine Bay"
	icon_state = "engine"
	sound_environment = SOUND_AREA_LARGE_ENCLOSED
	ambience_index = AMBIENCE_ENGI

/area/shuttle/hedon/fore
	name = "NTDS 'Hedon' Fore"
	icon_state = "commons"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/shuttle/hedon/freezer
	name = "NTDS 'Hedon' Walk-In Freezer"
	icon_state = "kitchen_cold"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/shuttle/hedon/hydro
	name = "NTDS 'Hedon' Hydroponics Lab"
	icon_state = "hydro"
	sound_environment = SOUND_AREA_MEDIUM_SOFTFLOOR

/area/shuttle/hedon/kitchen
	name = "NTDS 'Hedon' Kitchen"
	icon_state = "kitchen"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/shuttle/hedon/medbay
	name = "NTDS 'Hedon' Medical Clinic"
	icon_state = "medbay"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	ambience_index = AMBIENCE_MEDICAL

/area/shuttle/hedon/midship
	name = "NTDS 'Hedon' Midship"
	icon_state = "commons"

/area/shuttle/hedon/pool
	name = "NTDS 'Hedon' Swimming Pool"
	icon_state = "pool"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/shuttle/hedon/port
	name = "NTDS 'Hedon' Port"
	icon_state = "dorms"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/area/shuttle/hedon/port_bunks
	name = "NTDS 'Hedon' Port Bunks"
	icon_state = "dorms"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/shuttle/hedon/sauna
	name = "NTDS 'Hedon' Sauna"
	icon_state = "sauna"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/shuttle/hedon/starboard
	name = "NTDS 'Hedon' Starboard"
	icon_state = "commons"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/area/shuttle/hedon/starboard_bunks
	name = "NTDS 'Hedon' Starboard Bunks"
	icon_state = "dorms"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR
