/datum/emote
	cooldown = 0.5 SECONDS
	general_emote_audio_cooldown = 0.5 SECONDS
	specific_emote_audio_cooldown = 0.5 SECONDS

/datum/emote/living/whine
	key = "whine"
	key_third_person = "whines"
	message = "whines!"
	emote_type = EMOTE_AUDIBLE
	vary = TRUE
	sound = 'modular_nova/modules_bluemoon/emotes/sound/voice/whine.ogg'

/datum/emote/living/mwag
	key = "mwag"
	key_third_person = "waggles"
	message = "waggles their antennae!"
	emote_type = EMOTE_VISIBLE

/datum/emote/living/amwag
	key = "amwag"
	key_third_person = "waggles"
	message = "waggles their antennae ANGRILY!"
	emote_type = EMOTE_VISIBLE

/datum/emote/twerk
	key = "twerk"
	key_third_person = "twerks"
	message = "twerks their butt around!"
	hands_use_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer, /mob/eye/imaginary_friend)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer, /mob/living/silicon/ai, /mob/eye/imaginary_friend)

/datum/emote/twerk/run_emote(mob/living/user, params , type_override, intentional)
	. = ..()
	if(intentional && !HAS_TRAIT(user, TRAIT_FREERUNNING) && !HAS_TRAIT(user, TRAIT_STYLISH) && !do_after(user, 1 SECONDS, target = user, hidden = TRUE))
		return
	if(isliving(user))
		INVOKE_ASYNC(user, TYPE_PROC_REF(/mob/living, do_stagger_animation))
		INVOKE_ASYNC(user, TYPE_PROC_REF(/mob/living, do_stagger_animation))

/datum/emote/twerk/check_cooldown(mob/user, intentional)
	. = ..()
	if(.)
		return
	if(!can_run_emote(user, intentional = intentional))
		return
