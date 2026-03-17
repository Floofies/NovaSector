/obj/machinery/computer/shuttle/hedon
	name = "NTDS 'Hedon'"
	desc = "Used to control the NTDS 'Hedon'."
	circuit = /obj/item/circuitboard/computer/hedon
	shuttleId = "hedon"
	possible_destinations = "hedon_home;whiteship_away;whiteship_home;whiteship_z4;whiteship_lavaland;hedon_custom"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/circuitboard/computer/hedon
	name = "NTDS 'Hedon' Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/hedon

/obj/machinery/computer/camera_advanced/shuttle_docker/hedon
	name = "NTDS 'Hedon' Navigation Computer"
	desc = "Used to designate a precise transit location for the NTDS 'Hedon'."
	shuttleId = "hedon"
	lock_override = NONE
	shuttlePortId = "hedon_custom"
	jump_to_ports = list(
		"hedon_home" = 1,
		"whiteship_away" = 1,
		"whiteship_home" = 1,
		"whiteship_lavaland" = 1,
		"whiteship_z4" = 1,
	)
	view_range = 15
	designate_time = 5 SECONDS
	x_offset = -16
	y_offset = 16
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
