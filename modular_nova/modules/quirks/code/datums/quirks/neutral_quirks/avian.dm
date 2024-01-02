/datum/quirk/item_quirk/avian
	name = "Avian Traits"
	desc = "You're a birdbrain, or you've got a bird's brain. This will replace most other tongue-based speech quirks."
	mob_trait = TRAIT_AVIAN
	icon = FA_ICON_KIWI_BIRD
	value = 0
	medical_record_text = "Patient exhibits avian-adjacent mannerisms."

/datum/quirk/item_quirk/avian/add_unique(client/client_source)
	var/mob/living/carbon/human/human_holder = quirk_holder
	var/obj/item/organ/internal/tongue/avian/new_tongue = new(get_turf(human_holder))

	new_tongue.copy_traits_from(human_holder.get_organ_slot(ORGAN_SLOT_TONGUE))
	new_tongue.Insert(human_holder, special = TRUE, drop_if_replaced = FALSE)
