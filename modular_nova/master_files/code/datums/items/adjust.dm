///Adjusts the light_color of an atom by calling set_light_color(new_color). Only functions on atoms.
/datum/action/adjust_flashlight_color
	name = "Adjust Flashight Color"
	button_icon = 'icons/hud/radial.dmi'
	button_icon_state = "radial_recolor"

/datum/action/adjust_flashlight_color/New(Target)
	. = ..()
	if(target && !isatom(target))
		stack_trace("Attempted to create [type] linking with non-atom [target ? target.type : target]!")
		qdel(src)
		return

/datum/action/adjust_flashlight_color/Trigger(trigger_flags)
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
