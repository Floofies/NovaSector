/obj/effect/mapping_helpers/light
	name = "light helper"
	icon = 'modular_nova/modules_bluemoon/mapping/icons/mapping_helpers.dmi'
	icon_state = "lighting_helper"

/obj/effect/mapping_helpers/light/Initialize(mapload)
	..()
	if(!mapload)
		log_mapping("[src] spawned outside of mapload!")
		return

	var/obj/machinery/light/light = locate(/obj/machinery/light) in loc
	if(!light)
		log_mapping("[src] failed to find a light fixture at [AREACOORD(src)]")
	else
		payload(light)

///Applies the desired effects to the light object
/obj/effect/mapping_helpers/light/proc/payload(obj/machinery/light/light)
	return

// Disables flickering caused by explosions
/obj/effect/mapping_helpers/light/flickerproof
	name = "flicker-proof light helper"

/obj/effect/mapping_helpers/light/flickerproof/payload(obj/machinery/light/light)
	light.flicker_proof = TRUE

// Small lights

/obj/machinery/light/small/cold
	bulb_colour = LIGHT_COLOR_FAINT_BLUE
	nightshift_light_color = LIGHT_COLOR_FAINT_BLUE

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/light/small/cold, 0)


// Floor lights

/obj/machinery/light/floor/warm
	bulb_colour = "#fae5c1"

/obj/machinery/light/floor/warm/no_nightlight
	nightshift_allowed = FALSE

/obj/machinery/light/floor/cold
	bulb_colour = LIGHT_COLOR_FAINT_BLUE
	nightshift_light_color = LIGHT_COLOR_FAINT_BLUE

/obj/machinery/light/floor/cold/no_nightlight
	nightshift_allowed = FALSE

/obj/machinery/light/floor/dim
	nightshift_allowed = FALSE
	bulb_colour = "#FFDDCC"
	bulb_power = 0.6

/obj/machinery/light/floor/red
	bulb_colour = COLOR_VIVID_RED
	nightshift_allowed = FALSE
	no_low_power = TRUE

/obj/machinery/light/floor/blacklight
	bulb_colour = "#A700FF"
	nightshift_allowed = FALSE
