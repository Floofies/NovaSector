/datum/quirk/item_quirk/canine
	name = "Canidae Traits"
	desc = "Bark. You seem to act like a canine for whatever reason. This will replace most other tongue-based speech quirks."
	mob_trait = TRAIT_CANINE
	icon = FA_ICON_DOG
	value = 0
	medical_record_text = "Patient was seen digging through the trash can. Keep an eye on them."

/datum/quirk/item_quirk/canine/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/internal/tongue/dog/new_tongue = new(get_turf(human_holder))

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE))
	new_tongue.Insert(human_holder, special = TRUE, drop_if_replaced = FALSE)
