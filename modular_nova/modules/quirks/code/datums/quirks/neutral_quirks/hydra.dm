/// Includes a baseline sprite file, sprite override files, and mechanics for supporting three voices per person.
/datum/quirk/hydra
	name = "Hydra Heads"
	desc = "You are a tri-headed creature. To use, format name like (Rucks-Sucks-Ducks)"
	value = 0
	mob_trait = TRAIT_HYDRA_HEADS
	gain_text = span_notice("You hear two other voices inside of your head(s).")
	lose_text = span_danger("All of your minds become singular.")
	medical_record_text = "There are multiple heads and personalities affixed to one body."
	icon = FA_ICON_HORSE_HEAD
	// remember what the name was before activation
	var/original_name

/datum/quirk/hydra/add(client/client_source)
	var/mob/living/carbon/human/hydra = quirk_holder
	var/datum/action/innate/hydra/spell = new(hydra)
	var/datum/action/innate/hydrareset/resetspell = new(hydra)
	spell.Grant(hydra)
	spell.owner = hydra
	resetspell.Grant(hydra)
	resetspell.owner = hydra
