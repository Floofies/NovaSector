// Bluemoon edit - Allow guncases to spawn extra ammo
/obj/item/storage/toolbox/guncase/nova
	var/ammo_to_spawn

/obj/item/storage/toolbox/guncase/nova/PopulateContents()
	. = ..()
	if(!isnull(ammo_to_spawn))
		new ammo_to_spawn(src)
