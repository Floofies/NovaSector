/**
 * Component which allows clothing to behave like a flashlight, manage its atom light, and display a colored emissive overlay.
 * The simplest example is a headlamp that displays a few emissive pixels when turned on.
 * Allows for user customization of light range and color. Implements a sabotage/distruption effect and a rainbow-colored emag effect.
 * You should probably setup the parent item's light_system and light_range variables.
 */
/datum/component/worn_flashlight
	///The parent clothing item this component is attached to.
	var/obj/item/clothing/parent_clothing
	///Actions to add to the parent item's mob when the item is equipped.
	var/static/list/flashlight_component_action_types = list(
		/datum/action/item_action/toggle_light,
		/datum/action/adjust_light_color,
		/datum/action/adjust_light_range,
	)
	///Minimum range the user can set the light to. Enables the emissive overlay alone if the user enters 0.
	var/min_range = 0
	///Maximum range the user can set the light to. Disables adjust_light_range action if equal to min_range.
	var/max_range = 4
	///The last recorded light range the user set the light to.
	var/last_range = 0
	///The icon file to use for the emissive overlay. Uses the parent item's icon if set to null during initialization.
	var/emissive_icon
	///The iconstate to use for the emissive overlay. Disables the overlay if set to null during initialization.
	var/emissive_icon_state
	///Emissive overlay to display over the parent item's mob while wearing it.
	var/mutable_appearance/emissive_overlay
	///The mob that currently has the emissive overlay added.
	var/mob/living/carbon/human/overlay_holder
	///The sound effect that should play when the flashlight is enabled.
	var/sound/enable_sound
	///The sound effect that should play when the flashlight is disabled.
	var/sound/disable_sound
	///Colors for emag effect
	var/static/list/flashlight_component_emag_colors = list(
		"#0000FF",
		"#FF0000",
		"#FFFF00",
		"#00FF00",
		"#6600FF",
		"#FF6600",
	)
	///Cooldown for flashlight disruption
	COOLDOWN_DECLARE(sabotage_cooldown)

/datum/component/worn_flashlight/Initialize(emissive_icon, emissive_icon_state, sound_on_enabled, sound_on_disabled, min_light_range = 0, max_light_range = 4)
	. = ..()
	if (!isclothing(parent))
		return COMPONENT_INCOMPATIBLE

	parent_clothing = parent
	last_range = parent_clothing.light_range

	if(!isnull(sound_on_enabled))
		enable_sound = sound_on_enabled
	if(!isnull(sound_on_disabled))
		disable_sound = sound_on_disabled
	if(!isnull(min_light_range))
		min_range = min_light_range
	if(!isnull(max_light_range))
		max_range = max_light_range

	// Handle adding item associated actions
	for(var/action_type in flashlight_component_action_types)
		if(istype(action_type, /datum/action/adjust_light_range) && min_range == max_range)
			continue
		parent_clothing.add_item_action(action_type)

	RegisterSignal(parent_clothing, COMSIG_QDELETING, PROC_REF(parent_qdel))
	RegisterSignal(parent_clothing, COMSIG_ITEM_UI_ACTION_SLOT_CHECKED, PROC_REF(action_slot_check))
	RegisterSignal(parent_clothing, COMSIG_ITEM_DROPPED, PROC_REF(disable_light))
	RegisterSignal(parent_clothing, COMSIG_ITEM_EQUIPPED, PROC_REF(after_equipped))
	RegisterSignal(parent_clothing, COMSIG_ITEM_ATTACK_SELF, PROC_REF(toggle_light))
	RegisterSignal(parent_clothing, COMSIG_ATOM_UPDATE_LIGHT_COLOR, PROC_REF(light_color))
	RegisterSignal(parent_clothing, COMSIG_ATOM_SET_LIGHT_RANGE, PROC_REF(light_range))
	RegisterSignal(parent_clothing, COMSIG_ATOM_SABOTEUR_ACT, PROC_REF(sabotage_light))
	RegisterSignal(parent_clothing, COMSIG_ATOM_EMAG_ACT, PROC_REF(emag_light))

	if(isnull(emissive_icon_state))
		return
	emissive_overlay = emissive_appearance(
		isnull(emissive_icon) ? parent_clothing.icon : emissive_icon,
		emissive_icon_state,
		offset_spokesman = parent_clothing,
		alpha = parent_clothing.alpha,
	)
	//RegisterSignal(parent_clothing, COMSIG_ITEM_GET_WORN_OVERLAYS, PROC_REF(update_emissive_plane))

// Ensures that the emissive overlay and item actions are removed prior to qdeleting.
/datum/component/worn_flashlight/Destroy()
	disable_light()
	overlay_holder = null
	if(!isnull(emissive_overlay))
		QDEL_NULL(emissive_overlay)

	// Handle removing item associated actions
	for(var/action_type in flashlight_component_action_types)
		var/datum/action/action_to_remove = locate(action_type) in parent_clothing.actions
		if(action_to_remove)
			parent_clothing.remove_item_action(action_to_remove)
	parent_clothing = null
	return ..()

///Clean up properly if the parent qdeletes.
/datum/component/worn_flashlight/proc/parent_qdel(datum/source)
	SIGNAL_HANDLER

	qdel(src)

///Removes relevant actions if the parent item is equipped in an incompatible slot.
/datum/component/worn_flashlight/proc/action_slot_check(datum/source, mob/user, action, slot)
	SIGNAL_HANDLER

	if(!is_type_in_list(action, flashlight_component_action_types))
		return
	if(parent_clothing.slot_flags & slot)
		return
	return COMPONENT_ITEM_ACTION_SLOT_INVALID

/*
///Correct the plane of the emissive overlay when changing z-levels.
/datum/component/worn_flashlight/proc/update_emissive_plane(datum/source, mutable_appearance/standing, isinhands = FALSE)
	SIGNAL_HANDLER

	if(!isinhands)
		SET_PLANE_EXPLICIT(emissive_overlay, PLANE_TO_TRUE(emissive_overlay.plane), parent_clothing.loc)
*/

///Updates the emissive overlay on the parent clothing's mob.
/datum/component/worn_flashlight/proc/update_emissive(datum/source, mob/living/carbon/human/user)
	SIGNAL_HANDLER

	if(isnull(emissive_overlay))
		return
	if(!isnull(overlay_holder))
		overlay_holder.cut_overlay(emissive_overlay)
		LAZYREMOVE(overlay_holder.update_overlays_on_z, emissive_overlay)
		overlay_holder = null
	if(!parent_clothing.light_on)
		return
	if(isnull(user))
		user = parent_clothing.loc
	if(!ishuman(user))
		return
	SET_PLANE_EXPLICIT(emissive_overlay, ABOVE_LIGHTING_PLANE, user)
	emissive_overlay.color = parent_clothing.light_color
	user.apply_height_filters(emissive_overlay)
	user.add_overlay(emissive_overlay)
	// Updates overlay plane offset when changing Z-levels
	LAZYADD(user.update_overlays_on_z, emissive_overlay)
	overlay_holder = user

///Toggles the atom light of the parent item, and emissive overlay on its parent mob.
/datum/component/worn_flashlight/proc/toggle_light(datum/source, mob/living/carbon/human/user)
	SIGNAL_HANDLER

	if(isnull(user))
		user = parent_clothing.loc
	if(!parent_clothing.light_on && !COOLDOWN_FINISHED(src, sabotage_cooldown))
		if(ismob(user))
			parent_clothing.balloon_alert(user, "disrupted!")
		return COMPONENT_CANCEL_ATTACK_CHAIN
	// Show emissive overlay alone if range is 0
	if(parent_clothing.light_range > 0)
		parent_clothing.set_light_on(!parent_clothing.light_on)
	else
		parent_clothing.light_on = !parent_clothing.light_on
	if((parent_clothing.light_on && !isnull(enable_sound)) || !parent_clothing.light_on && !isnull(disable_sound))
		playsound(
			source = parent_clothing,
			soundin = parent_clothing.light_on ? enable_sound : disable_sound,
			vol = EQUIP_SOUND_VOLUME,
			vary = TRUE,
			extrarange = -3,
		)
	update_emissive(user = user)
	return COMPONENT_CANCEL_ATTACK_CHAIN

///Turn off flashlight if helmet gets dropped
/datum/component/worn_flashlight/proc/disable_light(datum/source, mob/living/carbon/human/user)
	SIGNAL_HANDLER

	stop_emag()
	if(parent_clothing.light_on)
		toggle_light(user = user)

///Listen for mob being emagged when equipped in compatible slot. Disable flashlight if equipped in incompatible slot.
/datum/component/worn_flashlight/proc/after_equipped(datum/source, mob/living/carbon/human/user, slot)
	SIGNAL_HANDLER

	if (parent_clothing.slot_flags & slot)
		RegisterSignal(user, COMSIG_ATOM_EMAG_ACT, PROC_REF(emag_light))
		return
	UnregisterSignal(user, COMSIG_ATOM_EMAG_ACT)
	disable_light(user = user)

///Update the emissive overlay when the flashlight is enabled and the color is changed.
/datum/component/worn_flashlight/proc/light_color(datum/source, new_color)
	SIGNAL_HANDLER

	if(parent_clothing.light_on)
		update_emissive()

///Block updating light range if outside max_range or min_range. Hide flashnight if range is set to 0.
/datum/component/worn_flashlight/proc/light_range(datum/source, new_range)
	SIGNAL_HANDLER

	if((new_range > max_range) || (new_range < min_range))
		return COMPONENT_BLOCK_LIGHT_UPDATE
	if(parent_clothing.light_on)
		if(new_range == 0)
			// Turn the flashlight off but enable emissive overlay if set to 0 range.
			toggle_light()
			parent_clothing.light_on = TRUE
			update_emissive()
		// Turn the actual flashlight back on if it was disabled from 0 range.
		else if(last_range == 0)
			parent_clothing.light_on = FALSE
			parent_clothing.set_light_on(TRUE)
	last_range = new_range

// Temporarily disables flashlight if hit with a light disruptor.
/datum/component/worn_flashlight/proc/sabotage_light(datum/source, disrupt_duration)
	SIGNAL_HANDLER

	if(!COOLDOWN_FINISHED(src, sabotage_cooldown))
		return
	disable_light()
	COOLDOWN_START(src, sabotage_cooldown, disrupt_duration)
	playsound(parent_clothing, 'sound/effects/sparks/sparks1.ogg', vol = 50, vary = TRUE)
	return COMSIG_SABOTEUR_SUCCESS

// Emag causes flashlight disco mode for 2 minutes
/datum/component/worn_flashlight/proc/emag_light(mob/living/carbon/human/source, mob/user)
	SIGNAL_HANDLER

	if(parent_clothing.obj_flags & EMAGGED)
		return
	parent_clothing.obj_flags |= EMAGGED
	process_emag(source)
	addtimer(CALLBACK(src, PROC_REF(stop_emag)), 2 MINUTES)
	return TRUE

// Enable the flashlight and randomize its color
/datum/component/worn_flashlight/proc/process_emag(mob/living/carbon/human/source)
	if(!(parent_clothing.obj_flags & EMAGGED))
		return
	if(!parent_clothing.light_on)
		toggle_light(user = source)
	parent_clothing.set_light_color(pick(flashlight_component_emag_colors))
	addtimer(CALLBACK(src, PROC_REF(process_emag), source), 0.5 SECONDS)

/datum/component/worn_flashlight/proc/stop_emag()
	parent_clothing.obj_flags &= ~EMAGGED
