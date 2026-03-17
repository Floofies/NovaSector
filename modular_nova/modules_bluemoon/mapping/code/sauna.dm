/obj/structure/sauna_oven
	light_color = COLOR_LIGHT_ORANGE
	light_range = 3
	light_power = 0.7
	light_on = FALSE

/obj/structure/sauna_oven/update_overlays()
	..()
	set_light_on(lit)
