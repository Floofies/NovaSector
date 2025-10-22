/// The coolest hiding spot ever.
/obj/structure/closet/cryo
	name = "broken cryogenic freezer"
	desc = "This broken cryo-pod was once a safe place for personnel to get some rest, but now it's only useful for keeping food cold."
	icon = 'modular_nova/modules/cryosleep/icons/cryogenics.dmi'
	icon_state = "cryopod"
	base_icon_state = "cryopod"
	has_opened_overlay = FALSE
	has_closed_overlay = FALSE
	paint_jobs = null
	sealed = TRUE
	anchored = TRUE
	can_weld_shut = FALSE
	can_install_electronics = FALSE
	divable = FALSE
	allow_objects = TRUE
	allow_dense = TRUE
	dense_when_open = TRUE
	open_sound = null
	close_sound = null
	mob_storage_capacity = 1

/obj/structure/closet/proc/close_pod(mob/living/user, mob/living/occupant)
	. = close(user)
	if(!. || !occupant || !ismob(occupant))
		return
	visible_message(span_danger("[src] hums and hisses, then sounds an alarm!"))
	balloon_alert_to_viewers("malfunctioning!")
	balloon_alert(occupant, "malfunctioning!")
	playsound(src, 'sound/machines/terminal/terminal_off.ogg', 70, TRUE)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), src, 'sound/machines/defib/defib_failed.ogg', 30, FALSE), 2 SECONDS)

/obj/structure/closet/cryo/process_internal_air(seconds_per_tick)
	if(opened)
		var/datum/gas_mixture/current_exposed_air = loc.return_air()
		if(!current_exposed_air)
			return
		// The internal air won't cool down the external air when the freezer is opened.
		internal_air.temperature = max(current_exposed_air.temperature, internal_air.temperature)
		return ..()
	if(internal_air.temperature <= (T0C - 60))
		return
	internal_air.temperature -= min(4 * seconds_per_tick, internal_air.temperature - (T0C - 60))

/obj/structure/closet/cryo/update_icon_state()
	icon_state = opened ? "cryopod-open" : "cryopod"
	return ..()

/obj/structure/closet/cryo/mouse_drop_receive(mob/living/target, mob/user, params)
	if(!ismob(target) || isanimal(target) || !isturf(user.loc) || target.buckled)
		return

	if(LAZYLEN(target.buckled_mobs) > 0)
		if(target == user)
			to_chat(user, span_danger("You can't fit into the cryopod while someone is buckled to you."))
		else
			to_chat(user, span_danger("You can't fit [target] into the cryopod while someone is buckled to them."))
		return

	if(!opened)
		to_chat(user, span_notice("[src] is already occupied!"))
		return

	if(target.stat == DEAD)
		to_chat(user, span_notice("Dead people can not be put into cryo."))
		return

	if(target == user)
		if(tgui_alert(target, "Would you like to enter cryosleep?", "Enter Cryopod?", list("Yes", "No")) != "Yes")
			return

	if(!can_interact(user) || !target.Adjacent(user) || !ismob(target) || isanimal(target) || !isturf(user.loc) || target.buckled)
		return

	if(!opened)
		to_chat(user, span_notice("[src] is already occupied!"))
		return

	var/turf/freezer_turf = get_turf(src)
	target.forceMove(freezer_turf)
	..()
	close_pod(user, target)

