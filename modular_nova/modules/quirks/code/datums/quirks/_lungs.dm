/datum/quirk/equipping/lungs
	abstract_parent_type = /datum/quirk/equipping/lungs
	icon = FA_ICON_LUNGS
	var/obj/item/organ/internal/lungs/lungs_holding
	var/obj/item/organ/internal/lungs/lungs_added
	var/lungs_typepath = /obj/item/organ/internal/lungs
	items = list(/obj/item/clothing/accessory/breathing = list(ITEM_SLOT_BACKPACK))
	var/breath_type = "oxygen"

/datum/quirk/equipping/lungs/add(client/client_source)
	var/mob/living/carbon/human/carbon_holder = quirk_holder
	if (!istype(carbon_holder) || !lungs_typepath)
		return
	var/current_lungs = carbon_holder.get_organ_slot(ORGAN_SLOT_LUNGS)
	if (istype(current_lungs, lungs_typepath))
		return
	lungs_holding = current_lungs
	if(!isnull(lungs_holding))
		lungs_holding.organ_flags |= ORGAN_FROZEN // stop decay on the old lungs
	lungs_added = new lungs_typepath
	lungs_added.Insert(carbon_holder, special = TRUE)
	if(!isnull(lungs_holding))
		lungs_holding.moveToNullspace() // save them for later

/datum/quirk/equipping/lungs/remove()
	var/mob/living/carbon/carbon_holder = quirk_holder
	if (!istype(carbon_holder) || !istype(lungs_holding))
		return
	var/obj/item/organ/internal/lungs/lungs = carbon_holder.get_organ_slot(ORGAN_SLOT_LUNGS)
	if (lungs != lungs_added && lungs != lungs_holding)
		qdel(lungs_holding)
		return
	lungs_holding.Insert(carbon_holder, special = TRUE, drop_if_replaced = FALSE)
	lungs_holding.organ_flags &= ~ORGAN_FROZEN

/datum/quirk/equipping/lungs/on_equip_item(obj/item/equipped, success)
	var/mob/living/carbon/human/human_holder = quirk_holder
	if (!istype(equipped, /obj/item/clothing/accessory/breathing))
		return
	var/obj/item/clothing/accessory/breathing/acc = equipped
	acc.breath_type = breath_type
	if (acc.can_attach_accessory(human_holder?.w_uniform, human_holder))
		acc.attach(human_holder.w_uniform, human_holder)
