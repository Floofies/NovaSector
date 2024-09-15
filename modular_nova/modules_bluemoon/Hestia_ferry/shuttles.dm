/datum/map_template/shuttle/hestiaferry
	port_id = "hestia"
	who_can_purchase = null
	suffix = "ferry"
	name = "Hestia Ferry"

/area/shuttle/hestia_ferry
	name = "Hestia Ferry"
	requires_power = FALSE
	fire_detect = FALSE
	icon_state = "shuttle"

/obj/docking_port/stationary/hestia_ferry
	name = "hestia dock 1"
	shuttle_id = "hestia_ferry_home"
	roundstart_template = /datum/map_template/shuttle/hestiaferry
	height = 28
	width = 9
	dwidth = 0
	dheight = 10

/obj/docking_port/mobile/hestia_ferry
	name = "Hestia Ferry"
	shuttle_id = "hestia_ferry"
	dir = EAST
	port_direction = NORTH
	preferred_direction = NORTH
	launch_status = 0
	callTime = 250
	movement_force = list("KNOCKDOWN"=0,"THROW"=0)
