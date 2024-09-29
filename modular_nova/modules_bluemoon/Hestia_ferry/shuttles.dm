/datum/map_template/shuttle/hestia_ferry
	name = "Hestia Ferry"
	port_id = "hestia"
	suffix = "ferry"
	who_can_purchase = null

/area/shuttle/hestia_ferry
	name = "Hestia Ferry"
	fire_detect = FALSE

/obj/docking_port/stationary/hestia_ferry_home
	name = "Hestia Ferry Dock 1"
	shuttle_id = "hestia_ferry_home"
	roundstart_template = /datum/map_template/shuttle/hestia_ferry
	height = 28
	width = 9
	dheight = 10

/obj/docking_port/stationary/hestia_ferry_away
	name = "Hestia Ferry Dock 1"
	shuttle_id = "hestia_ferry_away"
	height = 28
	width = 9
	dheight = 10

/obj/docking_port/mobile/hestia_ferry
	name = "Hestia Ferry"
	shuttle_id = "hestia_ferry"
	port_direction = SOUTH
	preferred_direction = NORTH
	launch_status = 0
	callTime = 25 SECONDS
	movement_force = list("KNOCKDOWN"=0,"THROW"=0)
