// Override which includes species-specific quirks for jelly and synthetic species.
/datum/quirk/blooddeficiency
	species_quirks = list(
		/datum/species/synthetic = /datum/quirk/blooddeficiency/synth,
		/datum/species/jelly = /datum/quirk/blooddeficiency/jelly
	)

// Override of Blood Deficiency quirk for synthetic species.
// Does not appear in TGUI or the character preferences window.
/datum/quirk/blooddeficiency/synth
	name = "Hydraulic Leak"
	desc = "Your body's hydraulic fluids are leaking through their seals."
	medical_record_text = "Patient requires regular treatment for hydraulic fluid loss."
	mail_goodies = list(/obj/item/reagent_containers/blood/oil)
	hidden_quirk = TRUE

// Override of Blood Deficiency quirk for jelly/slime species.
// Does not appear in TGUI or the character preferences window.
/datum/quirk/blooddeficiency/jelly
	name = "Jelly Dessication"
	desc = "Your body can't produce enough jelly to sustain itself."
	medical_record_text = "Patient requires regular treatment for slime jelly loss."
	mail_goodies = list(/obj/item/reagent_containers/blood/jelly)
	hidden_quirk = TRUE

// Omits the NOBLOOD check for jelly/slime species.
// TODO: There is a better way to do this in the species code itself.
/datum/quirk/blooddeficiency/jelly/process(seconds_per_tick)
	if(quirk_holder.stat == DEAD)
		return

	var/mob/living/carbon/human/carbon_target = quirk_holder
	if (carbon_target.blood_volume <= min_blood)
		return

	// Ensures that we don't reduce total blood volume below min_blood.
	carbon_target.blood_volume = max(min_blood, carbon_target.blood_volume - carbon_target.dna.species.blood_deficiency_drain_rate * seconds_per_tick)
