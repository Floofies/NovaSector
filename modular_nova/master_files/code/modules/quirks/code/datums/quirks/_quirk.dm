/datum/quirk
	/// Is this quirk restricted to veteran players only?
	var/veteran_only = FALSE
	// Is this quirk hidden from TGUI / the character preferences window?
	var/hidden_quirk = FALSE

	/// A list which associates Species Datums with Quirk Datums.
	/// Associations are detours to species-specific sub-Quirks which match to a Quirk holder's Species.
	/// Subtypes should come before parent types.
	/* Example:
	 * /datum/quirk/myquirk
	 *	species_quirks = list(
	 *		/datum/species/robotic = /datum/quirk/myquirk/robotic,
	 *		/datum/species/jelly = /datum/quirk/myquirk/jelly
	 *	)
	*/
	var/list/species_quirks

/**
 * Nova Sector override to add the Quirk to a new quirk_holder.
 *
 * Detours/swaps to a species-specific sub-Quirk which matches new_holder's Species, via "species_quirks".
 *
 * Performs logic to make sure new_holder is a valid holder of this quirk.
 * Returns FALSEy if there was some kind of error. Returns TRUE otherwise.
 * Arguments:
 * * new_holder - The mob to add this quirk to.
 * * quirk_transfer - If this is being added to the holder as part of a quirk transfer. Quirks can use this to decide not to spawn new items or apply any other one-time effects.
 */
/datum/quirk/add_to_holder(mob/living/new_holder, quirk_transfer, client_source)
	if(!species_quirks || !ishuman(new_holder))
		// No species Quirks, or if mob isn't Human (lacks Species Datum).
		// Add Quirk as-is.
		return ..()

	for(var/species_type in species_quirks)
		// Check Quirk holder's Species against the Species Datums in the list.
		// Any subclass of the Species can exist in the list.
		if(!is_species(new_holder, species_type))
			continue

		// Species Datum successfully matched to Quirk Datum:
		var/datum/quirk/sub_quirk = species_quirks[species_type]
		sub_quirk = new sub_quirk()

		// This null prevents infinite loop/detour, because Sub-Quirks inherit species_quirks.
		// Setting null here is convenient and removes any need to do it in the subclass.
		sub_quirk.species_quirks = null

		qdel(src)
		return sub_quirk.add_to_holder(new_holder, quirk_transfer, client_source)

	// No Species Datum matched the Quirk holder's Species Datum.
	// Add Quirk as-is without detouring.
	return ..()
