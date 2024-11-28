///Adjusts the light_color of an atom by calling set_light_color(new_color). Only functions on atoms.
/datum/action/adjust_light_color
	name = "Adjust Light Color"
	button_icon = 'icons/hud/radial.dmi'
	button_icon_state = "radial_recolor"

/datum/action/adjust_light_color/New(Target)
	. = ..()
	if(target && !isatom(target))
		stack_trace("Attempted to create [type] linking with non-atom [target ? target.type : target]!")
		qdel(src)
		return

/datum/action/adjust_light_color/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return FALSE
	var/atom/target_atom = target
	var/new_color = input(owner, "Choose a new color for [target_atom]'s flashlight.", "Light Color", target_atom.light_color) as color|null
	if(isnull(new_color))
		return FALSE
	if(is_color_dark(new_color, 50))
		target_atom.balloon_alert(owner, "color too dark!")
		return FALSE
	target_atom.set_light_color(new_color)
	return TRUE

///Adjusts the light_range of an atom by calling set_light_range(new_range). Only functions on atoms.
/datum/action/adjust_light_range
	name = "Adjust Light Range"
	button_icon = 'icons/obj/lighting.dmi'
	button_icon_state = "lbulb"
	var/max_range = 4
	var/min_range = 0

/datum/action/adjust_light_range/New(Target)
	. = ..()
	if(target && !isatom(target))
		stack_trace("Attempted to create [type] linking with non-atom [target ? target.type : target]!")
		qdel(src)
		return

/datum/action/adjust_light_range/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return FALSE
	var/atom/target_atom = target
	var/new_range = tgui_input_number(owner, "Choose a range for [target_atom]'s flashlight.", "Light Range", target_atom.light_range, max_range, min_range)
	if(isnull(new_range))
		return FALSE
	target_atom.set_light_range(new_range)
	return TRUE
