/datum/design/board/ghost_generator
	name = "GHOST Board"
	desc = "The circuit board for a GHOST-type portable generator."
	id = "ghost_generator"
	build_path = /obj/item/circuitboard/machine/pacman/bluespace
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/board/portagrav
	name = "Portable Gravity Generator Board"
	desc = "The circuit board for a portable gravity generator."
	id = "port_grav"
	build_path = /obj/item/circuitboard/machine/portagrav
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
