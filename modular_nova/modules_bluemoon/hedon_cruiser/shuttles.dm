/datum/map_template/shuttle/hedon
	port_id = "hedon"
	who_can_purchase = null
	suffix = "cruiser"
	name = "NTDS 'Hedon'"

/obj/docking_port/stationary/hedon
	name = "Refueling Station: Port 10"
	shuttle_id = "hedon_home"
	roundstart_template = /datum/map_template/shuttle/hedon
	height = 37
	width = 85
	dheight = 2
	dwidth = 72

/obj/docking_port/mobile/hedon
	shuttle_id = "hedon"
	name = "NTDS 'Hedon'"
	port_direction = EAST
	preferred_direction = EAST
	can_move_docking_ports = TRUE
	launch_status = 0
	movement_force = list("KNOCKDOWN"=0,"THROW"=0)
	callTime = 5 MINUTES
	ignitionTime = 6.5 SECONDS
	after_takeoff_sound = sound('modular_nova/modules_bluemoon/hedon_cruiser/sound/hyperspace_begin_large.wav')
	shuttle_area_basetype = /area/shuttle/hedon

/area/shuttle/hedon
	name = "NTDS 'Hedon'"
	requires_power = TRUE
	fire_detect = FALSE
	mood_bonus = 10
	mood_message = "I love partying on the Hedon!"
	sound_environment = SOUND_AREA_STANDARD_STATION

/area/shuttle/hedon/external
	static_lighting = TRUE
	base_lighting_alpha = 0
	base_lighting_color = null
	sound_environment = SOUND_AREA_SPACE

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

/area/shuttle/hedon/captain_quarters
	name = "NTDS 'Hedon' Captain Quarters"
	icon_state = "bridge"

/area/shuttle/hedon/diner
	name = "NTDS 'Hedon' Cafeteria"
	icon_state = "cafeteria"

/area/shuttle/hedon/engine
	name = "NTDS 'Hedon' Engineering Bay"
	icon_state = "engi_lobby"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/shuttle/hedon/reactor
	name = "NTDS 'Hedon' Reactor Bay"
	icon_state = "engine"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

/area/shuttle/hedon/reactor_chamber
	name = "NTDS 'Hedon' Fusion Reactor"
	icon_state = "engine_sm"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_SMALL_ENCLOSED

/area/shuttle/hedon/engine_storage
	name = "NTDS 'Hedon' Engine Storage"
	icon_state = "engine_storage_shared"
	ambience_index = AMBIENCE_ENGI
	sound_environment = SOUND_AREA_LARGE_ENCLOSED

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

/area/shuttle/hedon/locker_room
	name = "NTDS 'Hedon' Locker Room & Cryopods"
	icon_state = "dorms"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

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

/area/shuttle/hedon/port_bunks
	name = "NTDS 'Hedon' Port Bunks"
	icon_state = "dorms"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/area/shuttle/hedon/sauna
	name = "NTDS 'Hedon' Sauna"
	icon_state = "sauna"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/shuttle/hedon/surgery
	name = "NTDS 'Hedon' Operating Room"
	icon_state = "surgery"
	sound_environment = SOUND_AREA_SMALL_ENCLOSED
	ambience_index = AMBIENCE_MEDICAL

/area/shuttle/hedon/mainframe
	name = "NTDS 'Hedon' Mainframe"
	icon_state = "ai"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/shuttle/hedon/starboard_bunks
	name = "NTDS 'Hedon' Starboard Bunks"
	icon_state = "dorms"
	sound_environment = SOUND_AREA_LARGE_SOFTFLOOR

/area/shuttle/hedon/bunks
	name = "NTDS 'Hedon' Bunks"
	icon_state = "dorms"
	sound_environment = SOUND_AREA_SMALL_SOFTFLOOR

/area/shuttle/hedon/bunks/one
	name = "NTDS 'Hedon' Bunk 1"

/area/shuttle/hedon/bunks/two
	name = "NTDS 'Hedon' Bunk 2"

/area/shuttle/hedon/bunks/three
	name = "NTDS 'Hedon' Bunk 3"

/area/shuttle/hedon/bunks/four
	name = "NTDS 'Hedon' Bunk 4"

/area/shuttle/hedon/bunks/five
	name = "NTDS 'Hedon' Bunk 5"

/area/shuttle/hedon/bunks/six
	name = "NTDS 'Hedon' Bunk 6"

/area/shuttle/hedon/bunks/seven
	name = "NTDS 'Hedon' Bunk 7"

/area/shuttle/hedon/bunks/eight
	name = "NTDS 'Hedon' Bunk 8"
