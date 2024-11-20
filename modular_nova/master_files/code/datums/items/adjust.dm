///Adjusts the light_color of an atom by calling set_light_color(new_color). Only functions on atoms.
/datum/action/adjust_flashlight_color
	name = "Adjust Flashight Color"

/datum/action/adjust_flashlight_color/New(Target)
	. = ..()
	if(!isatom(target))
		stack_trace("Attempted to create [type] linking with non-atom [target ? target.type : target]!")
		qdel(src)
		return
	// Adds a sprite overlay of the target atom on the action button
	AddComponent(/datum/component/action_item_overlay, target)

/datum/action/adjust_flashlight_color/apply_button_overlay(atom/movable/screen/movable/action_button/current_button, force = FALSE)
	. = ..()
	// Adds a sprite overlay that says "recolor" on the action button
	current_button.add_overlay(mutable_appearance('icons/hud/radial.dmi', "radial_recolor"))

/datum/action/adjust_flashlight_color/Trigger(trigger_flags)
	. = ..()
	if(!.)
		return FALSE
	var/atom/target_atom = target
	var/new_color = input(owner, "Choose a new color for [target_atom]'s flashlight.", "Light Color", target_atom.light_color) as color|null
	if(!new_color)
		return FALSE
	if(is_color_dark(new_color, 50))
		target_atom.balloon_alert(owner, "color too dark!")
		return FALSE
	target_atom.set_light_color(new_color)
	return TRUE
