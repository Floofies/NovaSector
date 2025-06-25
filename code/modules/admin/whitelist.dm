/** NOVA EDIT REMOVAL - Moved to modular for SQL implementation.
#define WHITELISTFILE "[global.config.directory]/whitelist.txt"

GLOBAL_LIST(whitelist)

// Bluemoon edit -  Reload whitelist when changed
var/whitelist_modtime = 0
/proc/load_whitelist()
	// Bluemoon edit -  Reload whitelist when changed
	whitelist_modtime = ftime(WHITELISTFILE)
	GLOB.whitelist = list()
	for(var/line in world.file2list(WHITELISTFILE))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue
		GLOB.whitelist += ckey(line)

	if(!GLOB.whitelist.len)
		GLOB.whitelist = null

/proc/check_whitelist(ckey)
	// Bluemoon edit -  Reload whitelist when changed
	if(ftime(WHITELISTFILE) != whitelist_modtime)
		load_whitelist()
	if(!GLOB.whitelist)
		return FALSE
	. = (ckey in GLOB.whitelist)

#undef WHITELISTFILE
*/ // NOVA EDIT END
