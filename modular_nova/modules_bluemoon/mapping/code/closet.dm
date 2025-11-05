/obj/structure/closet/radiation/wall
	door_anim_squish = 0.3
	door_anim_angle = 115
	door_hinge_x = -8.5
	wall_mounted = TRUE
	max_mob_size = MOB_SIZE_SMALL
	density = TRUE
	anchored = TRUE
	anchorable = FALSE
	paint_jobs = FALSE
	icon = 'modular_nova/modules_bluemoon/mapping/icons/obj/closet_wall.dmi'
	icon_state = "radiation_wall"
	icon_door = "radiation_wall"

/obj/structure/closet/radiation/wall/empty/PopulateContents()
	return

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/closet/radiation/wall, 32)

/obj/item/wallframe/radcloset
	name = "wall mounted radiation suit closet"
	desc = "It's a wall mounted storage unit for radiation suits. Apply to wall to use."
	icon = 'modular_nova/modules_bluemoon/mapping/icons/obj/closet_wall.dmi'
	icon_state = "radiation_mount"
	result_path = /obj/structure/closet/radiation/wall/empty
	pixel_shift = 32
