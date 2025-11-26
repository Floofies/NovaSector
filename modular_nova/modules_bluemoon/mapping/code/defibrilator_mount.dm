/obj/machinery/defibrillator_mount/charging/loaded/Initialize(mapload)
	. = ..()
	defib = new/obj/item/defibrillator/loaded(src)
	if(mapload)
		find_and_hang_on_wall()
	if(is_operational)
		begin_processing()

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/defibrillator_mount/charging/loaded, 28)
