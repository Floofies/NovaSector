/obj/machinery/door/airlock/keyed/marina
	name = "\improper Marina airlock"
	desc = "This door only opens when a keycard with the proper access is swiped."
	icon = 'modular_nova/modules/aesthetics/airlock/icons/airlocks/station/public.dmi'
	overlays_file = 'modular_nova/modules/aesthetics/airlock/icons/airlocks/station/overlays.dmi'
	greyscale_accent_color = "#E55C01"
	access_id = "marina"
	explosion_block = 1
	heat_proof = FALSE
	max_integrity = 350
	armor_type = /datum/armor/machinery_door
	resistance_flags = NONE
	move_resist = MOVE_FORCE_VERY_STRONG
	damage_deflection = AIRLOCK_DAMAGE_DEFLECTION_N
	autoclose = TRUE

/obj/machinery/door/airlock/keyed/marina/manager
	greyscale_accent_color = "#C4004E"
	access_id = "marina_manager"

/obj/machinery/door/airlock/public/glass/incinerator/atmos_exterior/shipstation
	name = "Left Turbine Exterior Airlock"

/obj/machinery/door/airlock/public/glass/incinerator/atmos_exterior/shipstation/secondary
	name = "Right Turbine Exterior Airlock"
	id_tag = INCINERATOR_ATMOS_AIRLOCK_EXTERIOR_SECONDARY
