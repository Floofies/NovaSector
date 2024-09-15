/obj/machinery/computer/shuttle/hestia_ferry
	name = "Hestia Ferry"
	desc = "Used to control the Hestia Ferry."
	circuit = /obj/item/circuitboard/computer/hestia_ferry
	shuttleId = "hestia_ferry"
	possible_destinations = "hestia_ferry_home;hestia_ship;hestia_ferry_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/circuitboard/computer/hestia_ferry
	name = "Hestia Ferry Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/hestia_ferry

/obj/machinery/computer/camera_advanced/shuttle_docker/hestia_ferry
	name = "Hestia Ferry Navigation Computer"
	desc = "Used to designate a precise transit location for the Hestia Ferry."
	shuttleId = "hestia_ferry"
	lock_override = NONE
	shuttlePortId = "hestia_ferry_custom"
	jump_to_ports = list("hestia_ferry_home" = 1, "hestia_ship" = 1)
	view_range = 15
	designate_time = 2 SECONDS
	x_offset = 7
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
