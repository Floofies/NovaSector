// Sabres, including the cargo variety

/obj/item/storage/belt/sabre/cargo
	name = "authentic shamshir leather sheath"
	desc = "A good-looking sheath that is advertised as being made of real Venusian black leather. It feels rather plastic-like to the touch, and it looks like it's made to fit a British cavalry sabre."
	icon = 'modular_nova/master_files/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/belt.dmi'

/obj/item/storage/belt/sabre/cargo/PopulateContents()
	new /obj/item/melee/sabre/cargo(src)
	update_appearance()

/obj/item/melee/sabre
	force = 20 // Original: 15
	wound_bonus = 5 // Original: 10
	bare_wound_bonus = 20 // Original: 25 Both down slightly, to make up for the damage buff, since it'd get a bit wacky ontop of the armor pen.

/obj/item/melee/sabre/cargo
	name = "authentic shamshir sabre"
	desc = "An expertly crafted historical human sword once used by the Persians which has recently gained traction due to Venusian historal recreation sports. One small flaw, the Taj-based company who produces these has mistaken them for British cavalry sabres akin to those used by high ranking Nanotrasen officials. Atleast it cuts the same way!"
	icon = 'modular_nova/modules/modular_weapons/icons/obj/melee.dmi'
	lefthand_file = 'modular_nova/modules/modular_weapons/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'modular_nova/modules/modular_weapons/icons/mob/inhands/weapons/swords_righthand.dmi'
	block_chance = 20
	armour_penetration = 25


// This is here so that people can't buy the Sabres and craft them into powercrepes
/datum/crafting_recipe/food/powercrepe
	blacklist = list(/obj/item/melee/sabre/cargo)

/obj/item/highfrequencyblade/vibrodachi
	name = "vibrodachi"
	desc = "A single edged sword with a blade vibrating at high frequency to sever the micromollecular bonds that hold a target's constituent matter together. The technology originated in cutting machine for the textile industry, and was utilized for adhoc, improvised weapons for decades before becoming formalized in mass-produced melee equipment."
	force = 5
	throwforce = 20
	wound_bonus = 20
	bare_wound_bonus = 25

/obj/item/katana/teknodachi
	name = "teknodachi"
	desc = "A single edged sword with a curved blade made out of exotic and tightly protected, patented composite materials that boast a superior strength, flexibility, and edge retention compared to steel. Apochryphally said to pass through metal detectors, but most spaceport terminal security measures can detect them anyway."
	force = 30
	icon_state = "energy_katana"
	inhand_icon_state = "energy_katana"
	worn_icon_state = "energy_katana"
