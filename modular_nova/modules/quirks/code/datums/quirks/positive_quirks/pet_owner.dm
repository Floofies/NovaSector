/datum/quirk/item_quirk/pet_owner
	name = "Pet Owner"
	desc = "You bring your pet to work with you so that it, too, can experience the dangers of station life."
	icon = FA_ICON_HORSE
	value = 4
	mob_trait = TRAIT_PET_OWNER
	veteran_only = TRUE
	gain_text = span_notice("You brought your pet with you to work.")
	lose_text = span_danger("You feel lonely, as if leaving somebody behind...")
	medical_record_text = "Patient mentions their fondness for their pet."
	mail_goodies = list(
		/obj/item/clothing/neck/petcollar
	)
	var/pet_type = NONE

/datum/quirk_constant_data/pet_owner
	associated_typepath = /datum/quirk/item_quirk/pet_owner
	customization_options = list(/datum/preference/choiced/pet_owner, /datum/preference/text/pet_name, /datum/preference/text/pet_desc)

/datum/quirk/item_quirk/pet_owner/add_unique(client/client_source)
	var/desired_pet = client_source?.prefs.read_preference(/datum/preference/choiced/pet_owner) || "Random"

	if(desired_pet != "Random")
		pet_type = GLOB.possible_player_pet[desired_pet]

	if(pet_type == NONE) // Pet not set, we're picking one for them.
		pet_type = pick(flatten_list(GLOB.possible_player_pet))

	var/obj/item/pet_carrier/carrier = new /obj/item/pet_carrier(get_turf(quirk_holder))
	var/mob/living/simple_animal/pet/pet = new pet_type(carrier)
	var/new_name = client_source?.prefs.read_preference(/datum/preference/text/pet_name)
	if (new_name)
		pet.name = new_name
	var/new_desc = client_source?.prefs.read_preference(/datum/preference/text/pet_desc)
	if (new_desc)
		pet.desc = new_desc
	carrier.add_occupant(pet)
	give_item_to_holder(
		carrier,
		list(
			LOCATION_HANDS = ITEM_SLOT_HANDS
		),
		flavour_text = "Looks tightly packed - you might not be able to put the pet back in once they're out.",
	)
