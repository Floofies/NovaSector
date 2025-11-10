/datum/action/cooldown/spell/summonitem/event
	var/static/list/area/summon_area_blacklist = list()

/datum/action/cooldown/spell/summonitem/event/before_cast(atom/cast_on)
	. = ..()
	if(length(summon_area_blacklist) == 0)
		return
	var/mob/living/user = usr
	var/area/user_area = get_area(user)
	if(is_type_in_list(user_area, summon_area_blacklist))
		to_chat(user, span_boldwarning("You cannot use this ability inside [user_area]!"))
		return SPELL_CANCEL_CAST

/datum/action/cooldown/spell/summonitem/event/try_recall_item(mob/living/caster)
	var/obj/item_to_retrieve = marked_item

	if(item_to_retrieve.loc)
		// I don't want to know how someone could put something
		// inside itself but these are wizards so let's be safe
		var/infinite_recursion = 0

		// if it's in something, you get the whole thing.
		while(!isturf(item_to_retrieve.loc) && infinite_recursion < 10)
			if(isitem(item_to_retrieve.loc))
				var/obj/item/mark_loc = item_to_retrieve.loc
				// Being able to summon abstract things because
				// your item happened to get placed there is a no-no
				if(mark_loc.item_flags & ABSTRACT)
					break

			// If its on someone, properly drop it
			if(ismob(item_to_retrieve.loc))
				var/mob/holding_mark = item_to_retrieve.loc

				// Items in silicons warp the whole silicon
				if(issilicon(holding_mark))
					holding_mark.loc.visible_message(span_warning("[holding_mark] suddenly disappears!"))
					holding_mark.forceMove(caster.loc)
					holding_mark.loc.visible_message(span_warning("[holding_mark] suddenly appears!"))
					item_to_retrieve = null
					break

				holding_mark.dropItemToGround(item_to_retrieve)

			else if(isobj(item_to_retrieve.loc))
				var/obj/retrieved_item = item_to_retrieve.loc
				// Can't bring anchored things
				if(retrieved_item.anchored)
					break
				// Edge cases for moving certain machinery...
				if(istype(retrieved_item, /obj/machinery/portable_atmospherics))
					var/obj/machinery/portable_atmospherics/atmos_item = retrieved_item
					atmos_item.disconnect()
					atmos_item.update_appearance()

				// Otherwise bring the whole thing with us
				item_to_retrieve = retrieved_item

			infinite_recursion += 1

	else
		// Organs are usually stored in nullspace
		if(isorgan(item_to_retrieve))
			var/obj/item/organ/organ = item_to_retrieve
			if(organ.owner)
				// If this code ever runs I will be happy
				log_combat(caster, organ.owner, "magically removed [organ.name] from", addition = "COMBAT MODE: [uppertext(caster.combat_mode)]")
				organ.Remove(organ.owner)

	if(!item_to_retrieve)
		return

	item_to_retrieve.loc?.visible_message(span_warning("[item_to_retrieve] suddenly disappears!"))

	if(isitem(item_to_retrieve) && caster.put_in_hands(item_to_retrieve))
		item_to_retrieve.loc.visible_message(span_warning("[item_to_retrieve] suddenly appears in [caster]'s hand!"))
	else
		item_to_retrieve.forceMove(caster.drop_location())
		item_to_retrieve.loc.visible_message(span_warning("[item_to_retrieve] suddenly appears!"))
	playsound(get_turf(item_to_retrieve), 'sound/effects/magic/summonitems_generic.ogg', 50, TRUE)
