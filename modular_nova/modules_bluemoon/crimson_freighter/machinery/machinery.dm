/obj/machinery/computer/shuttle/crimson
	name = "SEV 'Crimson'"
	desc = "Used to control the SEV 'Crimson'."
	icon = 'modular_nova/modules/advanced_shuttles/icons/computer.dmi'
	icon_state = "computer_left"
	icon_keyboard = ""
	icon_screen = ""
	connectable = FALSE
	circuit = /obj/item/circuitboard/computer/crimson
	shuttleId = "crimson"
	possible_destinations = "crimson_home;whiteship_away;whiteship_home;whiteship_z4;whiteship_lavaland;crimson_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/circuitboard/computer/crimson
	name = "SEV 'Crimson' Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/crimson

/obj/machinery/computer/camera_advanced/shuttle_docker/crimson
	name = "SEV 'Crimson' Navigation Computer"
	desc = "Used to designate a precise transit location for the SEV 'Crimson'."
	icon = 'modular_nova/modules/advanced_shuttles/icons/computer.dmi'
	icon_state = "computer"
	icon_keyboard = ""
	icon_screen = ""
	connectable = FALSE
	shuttleId = "crimson"
	lock_override = NONE
	shuttlePortId = "crimson_custom"
	jump_to_ports = list(
		"crimson_home" = 1,
		"whiteship_away" = 1,
		"whiteship_home" = 1,
		"whiteship_lavaland" = 1,
		"whiteship_z4" = 1,
	)
	view_range = 15
	designate_time = 5 SECONDS
	x_offset = 7
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/machinery/computer/crew/shuttle/crimson
	icon_state = "computer_right"
