/// A highly customizable quirk designed to make you fear death, and introduce a more fair mortality the DNR quirk is unable to.
/datum/quirk/death_consequences
	name = DEATH_CONSEQUENCES_QUIRK_NAME
	desc = "Every time you die, your body suffers long-term damage that can't easily be repaired."
	medical_record_text = DEATH_CONSEQUENCES_QUIRK_DESC
	icon = FA_ICON_DNA
	value = 0 // due to its high customization, you can make it really inconsequential

/datum/quirk_constant_data/death_consequences
	associated_typepath = /datum/quirk/death_consequences

/datum/quirk_constant_data/death_consequences/New()
	customization_options = (subtypesof(/datum/preference/numeric/death_consequences) + subtypesof(/datum/preference/toggle/death_consequences))

	return ..()

/datum/quirk/death_consequences/add(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.gain_trauma(/datum/brain_trauma/severe/death_consequences, TRAUMA_RESILIENCE_ABSOLUTE)
	var/datum/brain_trauma/severe/death_consequences/added_trauma = human_holder.get_death_consequences_trauma()
	if (!isnull(added_trauma))
		added_trauma.update_variables(client_source)

	to_chat(human_holder, span_danger("You suffer from [src]. By default, you will \
		degrade every time you die, and recover very slowly while alive. This may be expedited by resting, sleeping, being buckled \
		to something cozy, or using rezadone.\n\
		As your degradation rises, so too will negative effects, such as stamina damage or a worsened crit threshold.\n\
		You can alter your degradation on the fly via the Adjust death degradation verb, and change your settings via the Refresh death consequence variables verb."))

/datum/quirk/death_consequences/remove()
	var/mob/living/carbon/human/human_holder = quirk_holder
	human_holder.cure_trauma_type(/datum/brain_trauma/severe/death_consequences, TRAUMA_RESILIENCE_ABSOLUTE)
