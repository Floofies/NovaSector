GLOBAL_VAR_INIT(DNR_trait_overlay, generate_DNR_trait_overlay())

/// Instantiates GLOB.DNR_trait_overlay by creating a new mutable_appearance instance of the overlay.
/proc/generate_DNR_trait_overlay()
	RETURN_TYPE(/mutable_appearance)

	var/mutable_appearance/DNR_trait_overlay = mutable_appearance('modular_nova/modules/indicators/icons/DNR_trait_overlay.dmi', "DNR", FLY_LAYER)
	DNR_trait_overlay.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART
	return DNR_trait_overlay

/datum/quirk/dnr
	name = "Do Not Revive"
	desc = "For whatever reason, you cannot be revived in any way."
	gain_text = span_notice("Your spirit gets too scarred to accept revival.")
	lose_text = span_notice("You can feel your soul healing again.")
	medical_record_text = "Patient is a DNR, and cannot be revived in any way."
	value = 0
	mob_trait = TRAIT_DNR
	icon = FA_ICON_SKULL_CROSSBONES

/datum/quirk/dnr/add(client/client_source)
	. = ..()

	quirk_holder.update_dnr_hud()

/datum/quirk/dnr/remove()
	var/mob/living/old_holder = quirk_holder

	. = ..()

	old_holder.update_dnr_hud()

/mob/living/prepare_data_huds()
	. = ..()

	update_dnr_hud()

/// Adds the DNR HUD element if src has TRAIT_DNR. Removes it otherwise.
/mob/living/proc/update_dnr_hud()
	var/image/dnr_holder = hud_list?[DNR_HUD]
	if(isnull(dnr_holder))
		return

	var/icon/temporary_icon = icon(icon, icon_state, dir)
	dnr_holder.pixel_y = temporary_icon.Height() - world.icon_size

	if(HAS_TRAIT(src, TRAIT_DNR))
		set_hud_image_active(DNR_HUD)
		dnr_holder.icon_state = "hud_dnr"
	else
		set_hud_image_inactive(DNR_HUD)

/mob/living/carbon/human/examine(mob/user)
	. = ..()

	if(stat != DEAD && HAS_TRAIT(src, TRAIT_DNR) && (HAS_TRAIT(user, TRAIT_SECURITY_HUD) || HAS_TRAIT(user, TRAIT_MEDICAL_HUD)))
		. += "\n[span_boldwarning("This individual is unable to be revived, and may be permanently dead if allowed to die!")]"

/datum/atom_hud/data/human/dnr
	hud_icons = list(DNR_HUD)
