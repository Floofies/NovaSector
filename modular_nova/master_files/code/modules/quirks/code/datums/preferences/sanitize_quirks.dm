/// Cleans any quirks that should be hidden, or just simply don't exist from quirk code.
/datum/preferences/proc/sanitize_quirks()
	var/quirks_edited = FALSE
	for(var/datum/quirk/quirk as anything in all_quirks)
		if(!quirk || !(quirk in SSquirks.quirks))
			all_quirks.Remove(quirk)
			quirks_edited = TRUE
			continue

		quirk = SSquirks.quirks[quirk]
		// Explanation for this is above.
		if(!quirk || initial(quirk.hidden_quirk))
			all_quirks.Remove(quirk)
			quirks_edited = TRUE

	return quirks_edited
