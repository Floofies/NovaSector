/**
 * This datum defines an action that can be used by any mob/living to instantly admin heal themselves.
 * By default it has a 30 second cooldown.
 */
/datum/action/cooldown/aheal
	name = "Auto-Doc"
	desc = "Activate your Auto-Doc implant, to heal and revive."
	button_icon = 'modular_nova/modules_bluemoon/modular_event/base/event_aheal_recall_spells/icons/button.dmi'
	button_icon_state = "arena_heal"
	cooldown_time = 30 SECONDS
	var/static/list/area/aheal_area_blacklist = list()

/datum/action/cooldown/aheal/New(Target)
	cooldown_time = CONFIG_GET(number/self_aheal_cooldown) SECONDS
	return ..()

/datum/action/cooldown/aheal/Activate(atom/target)
	var/mob/living/user = usr
	if(length(aheal_area_blacklist) > 0)
		var/area/user_area = get_area(user)
		if(is_type_in_list(user_area, aheal_area_blacklist))
			to_chat(user, span_boldwarning("You cannot use this ability inside [user_area]!"))
			return FALSE
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), user, 'sound/machines/defib/defib_charge.ogg', 50, FALSE, SHORT_RANGE_SOUND_EXTRARANGE), 1.5 SECONDS)
	playsound(user, 'sound/machines/defib/defib_ready.ogg', 50, FALSE, SHORT_RANGE_SOUND_EXTRARANGE)
	if(!do_after(user, 6 SECONDS))
		return
	if(prob(0.1))
		playsound(user, 'sound/effects/pray_chaplain.ogg', 40, FALSE, SHORT_RANGE_SOUND_EXTRARANGE)
	else
		playsound(user, 'sound/machines/defib/defib_zap.ogg', 50, FALSE, SHORT_RANGE_SOUND_EXTRARANGE)
	if (ishuman(user))
		var/mob/living/carbon/human/human_target = user
		human_target.electrocution_animation(LIGHTNING_BOLT_ELECTROCUTION_ANIMATION_LENGTH)
	user.revive(TRUE, TRUE)

	StartCooldown()

	return TRUE
