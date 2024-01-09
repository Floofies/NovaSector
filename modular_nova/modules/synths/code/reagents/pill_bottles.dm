// Pill bottles for synthetic healing medications
/obj/item/storage/pill_bottle/liquid_solder
	name = "bottle of liquid solder pills"
	desc = "Contains pills used to treat synthetic brain damage."

/obj/item/storage/pill_bottle/liquid_solder/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/liquid_solder(src)

/obj/item/storage/pill_bottle/nanite_slurry
	name = "bottle of nanite slurry pills"
	desc = "Contains pills used to treat robotic bodyparts."

/obj/item/storage/pill_bottle/nanite_slurry/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/nanite_slurry(src)

/obj/item/storage/pill_bottle/system_cleaner
	name = "bottle of system cleaner pills"
	desc = "Contains pills used to detoxify synthetic bodies."

/obj/item/storage/pill_bottle/system_cleaner/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/system_cleaner(src)
