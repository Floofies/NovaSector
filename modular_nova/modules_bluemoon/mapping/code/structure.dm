/obj/effect/spawner/structure/window/reinforced/shuttle/spaceship
	name = "spaceship window spawner"
	icon = 'modular_nova/modules/mapping/icons/unique/spaceships/shipwindows.dmi'
	icon_state = "pod_window-0"
	spawn_list = list(/obj/structure/grille/lattice, /obj/structure/window/reinforced/shuttle/spaceship)

/obj/effect/spawner/structure/window/reinforced/shuttle/spaceship/tinted
	spawn_list = list(/obj/structure/grille/lattice, /obj/structure/window/reinforced/shuttle/spaceship/tinted)

/obj/effect/spawner/structure/window/reinforced/shuttle/spaceship/unanchored
	spawn_list = list(/obj/structure/grille/lattice, /obj/structure/window/reinforced/shuttle/spaceship/unanchored)

/obj/structure/sink/kitchen/counter
	icon = 'modular_nova/modules_bluemoon/mapping/icons/obj/watercloset.dmi'
	icon_state = "sink_alt_counter"
	pixel_z = 4
	pixel_shift = 0

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sink/kitchen/counter, 0)
