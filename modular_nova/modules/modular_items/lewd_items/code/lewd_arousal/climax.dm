#define CLIMAX_VAGINA "Vagina"
#define CLIMAX_PENIS "Penis"
#define CLIMAX_BOTH "Both"

#define CLIMAX_ON_FLOOR "On the floor"
#define CLIMAX_IN_OR_ON "Climax in or on someone"
// Bluemoon edit - Climax in containers
#define CLIMAX_IN_CONTAINER "Climax in container"

/mob/living/carbon/human
	/// Used to prevent nightmare scenarios.
	var/refractory_period

// Bluemoon edit - Forced orgasms
/mob/living/carbon/human/proc/climax(manual = TRUE, is_forced = FALSE)
	if (CONFIG_GET(flag/disable_erp_preferences))
		return

	if(!client?.prefs?.read_preference(/datum/preference/toggle/erp/autocum) && !manual)
		return
	if(refractory_period > REALTIMEOFDAY)
		return
	refractory_period = REALTIMEOFDAY + 30 SECONDS
	// Bluemoon edit - Forced orgasms, Fix ERP pref
	if((!is_forced && has_status_effect(/datum/status_effect/climax_cooldown)) || !client?.prefs?.read_preference(/datum/preference/toggle/erp))
		return

	// Bluemoon edit - Oversensitive quirk
	if(HAS_TRAIT(src, TRAIT_OVERSENSITIVE))
		is_forced = TRUE
		manual = FALSE

	// Bluemoon edit - Forced orgasms
	if(HAS_TRAIT(src, TRAIT_NEVERBONER) || (!is_forced && has_status_effect(/datum/status_effect/climax_cooldown)) || (!has_vagina() && !has_penis()))
		visible_message(span_purple("[src] twitches, trying to cum, but with no result."), \
			span_purple("You can't have an orgasm!"), pref_to_check = /datum/preference/toggle/erp)
		return TRUE

	// Reduce pop-ups and make it slightly more frictionless (lewd).
	// Bluemoon edit - Allow two automatic orgasms at once
	var/climax_choice
	if(has_penis())
		climax_choice = CLIMAX_PENIS
		if(has_vagina())
			climax_choice = CLIMAX_BOTH
	else if(has_vagina())
		climax_choice = CLIMAX_VAGINA

	if(manual)
		var/list/genitals = list()
		if(has_vagina())
			genitals.Add(CLIMAX_VAGINA)
			if(has_penis())
				genitals.Add(CLIMAX_PENIS)
				genitals.Add(CLIMAX_BOTH)
		else if(has_penis())
			genitals.Add(CLIMAX_PENIS)
		// Bluemoon edit - Hide climax dialog if only one genital
		if(length(genitals) > 1)
			climax_choice = tgui_alert(src, "You are climaxing, choose which genitalia to climax with.", "Genitalia Preference!", genitals)

	switch(gender)
		if(MALE)
			playsound_if_pref(get_turf(src), pick('modular_nova/modules/modular_items/lewd_items/sounds/final_m1.ogg',
										'modular_nova/modules/modular_items/lewd_items/sounds/final_m2.ogg',
										'modular_nova/modules/modular_items/lewd_items/sounds/final_m3.ogg'), 50, TRUE, pref_to_check = /datum/preference/toggle/erp/sounds)
		if(FEMALE)
			playsound_if_pref(get_turf(src), pick('modular_nova/modules/modular_items/lewd_items/sounds/final_f1.ogg',
										'modular_nova/modules/modular_items/lewd_items/sounds/final_f2.ogg',
										'modular_nova/modules/modular_items/lewd_items/sounds/final_f3.ogg'), 50, TRUE, pref_to_check = /datum/preference/toggle/erp/sounds)

	var/self_orgasm = FALSE
	var/self_their = p_their()

	if(climax_choice == CLIMAX_PENIS || climax_choice == CLIMAX_BOTH)
		var/obj/item/organ/genital/penis/penis = get_organ_slot(ORGAN_SLOT_PENIS)
		// Bluemoon edit - Climax in containers
		var/obj/item/organ/genital/testicles/testicles = get_organ_slot(ORGAN_SLOT_TESTICLES)
		if(!testicles) //If we have no god damn balls, we can't cum anywhere... GET BALLS!
			visible_message(span_userlove("[src] orgasms, but nothing comes out of [self_their] penis!"), \
				span_userlove("You orgasm, it feels great, but nothing comes out of your penis!"), pref_to_check = /datum/preference/toggle/erp)

		else if(is_wearing_condom())
			var/obj/item/clothing/sextoy/condom/condom = src.penis
			condom.condom_use()
			// Bluemoon edit - Climax in containers
			var/amount = testicles.internal_fluid_count * 0.6
			testicles.adjust_internal_fluid(-amount)
			visible_message(span_userlove("[src] shoots [self_their] load into the [condom], filling it up!"), \
				span_userlove("You shoot your thick load into the [condom] and it catches it all!"), pref_to_check = /datum/preference/toggle/erp)

		else if(!is_bottomless() && penis.visibility_preference != GENITAL_ALWAYS_SHOW)
			visible_message(span_userlove("[src] cums inside [self_their] clothes!"), \
				span_userlove("You shoot your load, but you weren't naked, so you mess up your clothes!"), pref_to_check = /datum/preference/toggle/erp)
			self_orgasm = TRUE

		else
			// Bluemoon edit - Cyborg interactions
			var/list/interactable_inrange_partners = list()

			// Bluemoon edit - Climax in containers
			var/list/fillable_inrange_containers = list()

			// Bluemoon edit - Flexible quirk
			if(HAS_TRAIT(src, TRAIT_FLEXIBLE))
				interactable_inrange_partners[name] = src

			// Bluemoon edit - Climax in containers
			var/list/atoms_in_view = (view(1, src) - src)
			for(var/mob/living/carbon/human/iterating_human in atoms_in_view)
				interactable_inrange_partners[iterating_human.name] = iterating_human

			// Bluemoon edit - Cyborg interactions
			for(var/mob/living/silicon/robot/iterating_robot in atoms_in_view)
				interactable_inrange_partners[iterating_robot.name] = iterating_robot

			// Bluemoon edit - Climax in containers
			for(var/obj/item/reagent_containers/iterating_container in atoms_in_view)
				if((iterating_container.reagents.flags & OPENCONTAINER) || (iterating_container.reagents.flags & DUNKABLE))
					fillable_inrange_containers[iterating_container.name] = iterating_container

			var/list/buttons = list(CLIMAX_ON_FLOOR)

			// Bluemoon edit - Cyborg interactions
			if(interactable_inrange_partners.len)
				buttons += CLIMAX_IN_OR_ON

			// Bluemoon edit - Climax in containers
			if(fillable_inrange_containers.len)
				buttons += CLIMAX_IN_CONTAINER

			// Bluemoon edit - Forced orgasms
			var/penis_climax_choice
			if(is_forced)
				penis_climax_choice = CLIMAX_ON_FLOOR
			else
				penis_climax_choice = tgui_alert(src, "Choose where to shoot your load.", "Load preference!", buttons)

			var/create_cum_decal = FALSE

			if(isnull(penis_climax_choice) || penis_climax_choice == CLIMAX_ON_FLOOR)
				create_cum_decal = TRUE
				visible_message(span_userlove("[src] shoots [self_their] sticky load onto the floor!"), \
					span_userlove("You shoot string after string of hot cum, hitting the floor!"), pref_to_check = /datum/preference/toggle/erp)

			// Bluemoon edit - Climax in containers
			else if(penis_climax_choice == CLIMAX_IN_CONTAINER)
				var/target_choice = tgui_input_list(src, "Choose a container to cum in.", "Choose target!", fillable_inrange_containers)
				if(!target_choice)
					create_cum_decal = TRUE
					visible_message(span_userlove("[src] shoots [self_their] sticky load onto the floor!"), \
						span_userlove("You shoot string after string of hot cum, hitting the floor!"), pref_to_check = /datum/preference/toggle/erp)
				else
					visible_message(span_userlove("[src] shoots [self_their] sticky load into the [target_choice]!"), \
						span_userlove("You shoot string after string of hot cum into the [target_choice]!"), pref_to_check = /datum/preference/toggle/erp)
					var/obj/item/reagent_containers/container = fillable_inrange_containers[target_choice]
					testicles.transfer_internal_fluid(container.reagents, testicles.internal_fluid_count * 0.6)
			else
				var/target_choice = tgui_input_list(src, "Choose a person to cum in or on.", "Choose target!", interactable_inrange_partners)
				if(!target_choice)
					create_cum_decal = TRUE
					visible_message(span_userlove("[src] shoots [self_their] sticky load onto the floor!"), \
						span_userlove("You shoot string after string of hot cum, hitting the floor!"), pref_to_check = /datum/preference/toggle/erp)
				else
					var/mob/living/target = interactable_inrange_partners[target_choice]
					var/mob/living/carbon/human/target_human
					if(ishuman(target))
						target_human = target

					var/target_them = target.p_them()

					var/list/target_buttons = list()

					if(!target_human || !target_human.wear_mask)
						target_buttons += "mouth"
					if(!target_human || target_human.has_vagina(REQUIRE_GENITAL_EXPOSED))
						target_buttons += ORGAN_SLOT_VAGINA
					if(!target_human || target_human.has_anus(REQUIRE_GENITAL_EXPOSED))
						target_buttons += "asshole"
					if(!target_human)
						target_buttons += "sheath"
					else if(target_human.has_penis(REQUIRE_GENITAL_EXPOSED))
						var/obj/item/organ/genital/penis/other_penis = target_human.get_organ_slot(ORGAN_SLOT_PENIS)
						if(other_penis.sheath != "None")
							target_buttons += "sheath"
					target_buttons += "On [target_them]"

					var/climax_into_choice = tgui_input_list(src, "Where on or in [target] do you wish to cum?", "Final frontier!", target_buttons)

					if(!climax_into_choice)
						create_cum_decal = TRUE
						visible_message(span_userlove("[src] shoots their sticky load onto the floor!"), \
							span_userlove("You shoot string after string of hot cum, hitting the floor!"), pref_to_check = /datum/preference/toggle/erp)
					else if(climax_into_choice == "On [target_them]")
						create_cum_decal = TRUE
						visible_message(span_userlove("[src] shoots their sticky load onto [target]!"), \
							span_userlove("You shoot string after string of hot cum onto [target]!"), pref_to_check = /datum/preference/toggle/erp)
					else
						visible_message(span_userlove("[src] hilts [self_their] cock into [target]'s [climax_into_choice], shooting cum into [target_them]!"), \
							span_userlove("You hilt your cock into [target]'s [climax_into_choice], shooting cum into [target_them]!"), pref_to_check = /datum/preference/toggle/erp)
						to_chat(target, span_userlove("Your [climax_into_choice] fills with warm cum as [src] shoots [self_their] load into it."))
						// Bluemoon edit - Climax in containers
						if(target_human && climax_into_choice == "mouth")
							var/obj/item/organ/stomach/belly = target_human.get_organ_slot(ORGAN_SLOT_STOMACH)
							if(belly)
								testicles.transfer_internal_fluid(belly.reagents, testicles.internal_fluid_count * 0.6)
							else
								testicles.transfer_internal_fluid(null, testicles.internal_fluid_count * 0.6)

			// Bluemoon edit - Climax in containers
			/*
			var/obj/item/organ/genital/testicles/testicles = get_organ_slot(ORGAN_SLOT_TESTICLES)
			testicles.transfer_internal_fluid(null, testicles.internal_fluid_count * 0.6) // yep. we are sending semen to nullspace
			*/
			if(create_cum_decal)
				// Bluemoon edit - Add reagents to cum decals
				if(testicles)
					var/amount = testicles.internal_fluid_count * 0.6
					testicles.adjust_internal_fluid(-amount)
					add_cum_splatter_floor(get_turf(src), amount = amount)
				else
					add_cum_splatter_floor(get_turf(src))
				/*
				add_cum_splatter_floor(get_turf(src))
				*/

		try_lewd_autoemote("moan")
		if(climax_choice == CLIMAX_PENIS)
			// Bluemoon edit - Forced orgasms
			apply_status_effect(/datum/status_effect/climax, is_forced)
			if(!is_forced)
				apply_status_effect(/datum/status_effect/climax_cooldown)
			if(self_orgasm)
				add_mood_event("orgasm", /datum/mood_event/climaxself)
			return TRUE

	if(climax_choice == CLIMAX_VAGINA || climax_choice == CLIMAX_BOTH)
		var/obj/item/organ/genital/vagina/vagina = get_organ_slot(ORGAN_SLOT_VAGINA)
		if(is_bottomless() || vagina.visibility_preference == GENITAL_ALWAYS_SHOW)
			visible_message(span_userlove("[src] twitches and moans as [p_they()] climax from their vagina!"), span_userlove("You twitch and moan as you climax from your vagina!"), pref_to_check = /datum/preference/toggle/erp)
			// Bluemoon edit - Add reagents to cum decals
			var/amount = vagina.internal_fluid_count * 0.6
			vagina.adjust_internal_fluid(-amount)
			add_cum_splatter_floor(get_turf(src), female = TRUE, amount = amount)
		else
			visible_message(span_userlove("[src] cums in [self_their] underwear from [self_their] vagina!"), \
						span_userlove("You cum in your underwear from your vagina! Eww."), pref_to_check = /datum/preference/toggle/erp)
			self_orgasm = TRUE
	// Bluemoon edit - Forced orgasms
	apply_status_effect(/datum/status_effect/climax, is_forced)
	if(!is_forced)
		apply_status_effect(/datum/status_effect/climax_cooldown)
	if(self_orgasm)
		add_mood_event("orgasm", /datum/mood_event/climaxself)
	return TRUE

#undef CLIMAX_VAGINA
#undef CLIMAX_PENIS
#undef CLIMAX_BOTH
#undef CLIMAX_ON_FLOOR
#undef CLIMAX_IN_OR_ON
// Bluemoon edit - Climax in containers
#undef CLIMAX_IN_CONTAINER
