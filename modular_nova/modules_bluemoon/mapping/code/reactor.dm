// Bluemoon edit - Rename RB-MK2 to Laratel WF-15
/datum/gas/goblin
	desc = "A strange byproduct of using tritium in a Laratel WF-15 fusion reactor. Has interesting effects when inhaled."

/obj/machinery/power/rbmk2
	name = "\improper Laratel WF-15 fusion reactor"
	desc = "The Laratel WF-15 generates power by burning Tritium gas via a small nuclear fusion reactor system. This process generates external heat and waste, so a cooling and filtering system should be used. The conversion rate of tritium to power is based on the internal temperature of the fuel rod."

/obj/item/circuitboard/machine/rbmk2
	name = "Laratel WF-15 fusion reactor"

/obj/item/tank/rbmk2_rod
	name = "\improper WF-15 fuel rod"
	desc = "A rod for the Laratel WF-15 fusion reactor. Usually filled with tritium."

/obj/item/circuitboard/machine/rbmk2_sniffer
	name = "Laratel \"Boombox\" sniffer"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/rbmk2_sniffer
	req_components = list(
		/obj/item/stack/cable_coil = 4,
		/obj/item/stack/sheet/mineral/uranium = 1,
	)
	needs_anchored = TRUE

/obj/machinery/rbmk2_sniffer
	name = "\improper Laratel \"Boombox\" reactor sniffer"
	desc = "A modified air alarm designed to detect stray ionization particles, AKA a meltdown. Can be linked to nearby Laratel WF-15 reactors by interacting with the wires."

/datum/design/board/rbmk2_reactor
	name = "Laratel WF-15 Fusion Reactor Board"
	desc = "The circuit board for a Laratel WF-15 fusion reactor."
	id = "rbmk2_reactor"
	build_path = /obj/item/circuitboard/machine/rbmk2
	materials = list(/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 8)
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING,
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/board/rbmk2_reactor_sniffer
	name = "Laratel \"BoomBox\" Reactor Sniffer"
	desc = "The circuit board for a Laratel BoomBox reactor sniffer."
	id = "rbmk2_sniffer"
	build_path = /obj/item/circuitboard/machine/rbmk2_sniffer
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING,
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rbmk2_rod
	name = "Laratel WF-15 Fusion Reactor Fuel Rod"
	desc = "A specialized rod for the Laratel WF-15 fusion reactor."
	id = "rbmk2_rod"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 2)
	construction_time = 100
	build_path = /obj/item/tank/rbmk2_rod
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_GAS_TANKS,
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/techweb_node/rbmk2
	display_name = "Laratel WF-15 Fusion Reactor"
