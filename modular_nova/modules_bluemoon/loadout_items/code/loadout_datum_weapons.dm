/*
*	BALLISTIC HANDGUNS
*/

/datum/loadout_category/weapons/handle_duplicate_entires(
	datum/preference_middleware/loadout/manager,
	datum/loadout_item/conflicting_item,
	datum/loadout_item/added_item,
	list/datum/loadout_item/all_loadout_items,
)
	return TRUE

/datum/loadout_item/weapons/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(!outfit.r_hand)
		outfit.r_hand = item_path
	else if(!outfit.l_hand)
		outfit.l_hand = item_path
	else
		LAZYADD(outfit.backpack_contents, item_path)

/datum/loadout_item/weapons/handguns
	abstract_type = /datum/loadout_item/weapons/handguns
	group = "Ballistic Handguns"

/datum/loadout_item/weapons/handguns/doorhickey
	name = /obj/item/gun/ballistic/automatic/pistol/doorhickey::name
	item_path = /obj/item/gun/ballistic/automatic/pistol/doorhickey

/datum/loadout_item/weapons/handguns/executioner
	name = /obj/item/gun/ballistic/revolver/executioner::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/pistol/executioner
	ui_icon = /obj/item/gun/ballistic/revolver/executioner::icon
	ui_icon_state = /obj/item/gun/ballistic/revolver/executioner::icon_state

/datum/loadout_item/weapons/handguns/bobr
	name = /obj/item/gun/ballistic/revolver/shotgun_revolver::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/pistol/bobr
	ui_icon = /obj/item/gun/ballistic/revolver/shotgun_revolver::icon
	ui_icon_state = /obj/item/gun/ballistic/revolver/shotgun_revolver::icon_state

/datum/loadout_item/weapons/handguns/zashch
	name = /obj/item/gun/ballistic/automatic/pistol/zashch::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/pistol/zashch
	ui_icon = /obj/item/gun/ballistic/automatic/pistol/zashch::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pistol/zashch::icon_state

/datum/loadout_item/weapons/handguns/c38
	name = /obj/item/gun/ballistic/revolver/c38::name
	item_path = /obj/item/storage/toolbox/guncase/nova/pistol/c38
	ui_icon = /obj/item/gun/ballistic/revolver/c38::icon
	ui_icon_state = /obj/item/gun/ballistic/revolver/c38::icon_state

/datum/loadout_item/weapons/handguns/c38super
	name = /obj/item/gun/ballistic/revolver/c38/super::name
	item_path = /obj/item/storage/toolbox/guncase/nova/ntcase/pistol/c38super
	ui_icon = /obj/item/gun/ballistic/revolver/c38/super::icon
	ui_icon_state = /obj/item/gun/ballistic/revolver/c38/super::icon_state

/datum/loadout_item/weapons/handguns/enforcer
	name = /obj/item/gun/ballistic/automatic/pistol/enforcer::name
	item_path = /obj/item/storage/toolbox/guncase/traitor/enforcer
	ui_icon = /obj/item/gun/ballistic/automatic/pistol/enforcer::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pistol/enforcer::icon_state

/datum/loadout_item/weapons/handguns/wespe
	name = /obj/item/gun/ballistic/automatic/pistol/sol::name
	item_path = /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case/wespe/with_ammo
	ui_icon = /obj/item/gun/ballistic/automatic/pistol/sol::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pistol/sol::icon_state

/datum/loadout_item/weapons/handguns/skild
	name = /obj/item/gun/ballistic/automatic/pistol/trappiste::name
	item_path = /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case/skild/with_ammo
	ui_icon = /obj/item/gun/ballistic/automatic/pistol/trappiste::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pistol/trappiste::icon_state

/datum/loadout_item/weapons/handguns/takbok
	name = /obj/item/gun/ballistic/revolver/takbok::name
	item_path = /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case/takbok/with_ammo
	ui_icon = /obj/item/gun/ballistic/revolver/takbok::icon
	ui_icon_state = /obj/item/gun/ballistic/revolver/takbok::icon_state

/datum/loadout_item/weapons/handguns/bluvolva
	name = /obj/item/gun/ballistic/revolver/bluvolva::name
	item_path = /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case/bluvolva/with_ammo
	ui_icon = /obj/item/gun/ballistic/revolver/bluvolva::icon
	ui_icon_state = /obj/item/gun/ballistic/revolver/bluvolva::icon_state

/datum/loadout_item/weapons/handguns/gyropistol
	name = /obj/item/gun/ballistic/automatic/gyropistol::name
	item_path = /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case/bluvolva/with_ammo
	ui_icon = /obj/item/gun/ballistic/automatic/gyropistol::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/gyropistol::icon_state

/*
*	BALLISTIC LONG GUNS
*/

/datum/loadout_item/weapons/long_guns
	abstract_type = /datum/loadout_item/weapons/long_guns
	group = "Ballistic Long Guns"

/datum/loadout_item/weapons/long_guns/bogseo
	name = /obj/item/gun/ballistic/automatic/xhihao_smg::name
	item_path = /obj/item/storage/toolbox/guncase/nova/xhihao_large_case/bogseo
	ui_icon = /obj/item/gun/ballistic/automatic/xhihao_smg::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/xhihao_smg::icon_state

/datum/loadout_item/weapons/long_guns/napad
	name = /obj/item/gun/ballistic/automatic/napad::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/napad
	ui_icon = /obj/item/gun/ballistic/automatic/napad::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/napad::icon_state

/datum/loadout_item/weapons/long_guns/rc20
	name = /obj/item/gun/ballistic/automatic/c20r/reclaimed::name
	item_path = /obj/item/storage/toolbox/guncase/nova/rc20
	ui_icon = /obj/item/gun/ballistic/automatic/c20r/reclaimed::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/c20r/reclaimed::icon_state

/datum/loadout_item/weapons/long_guns/nt20
	name = /obj/item/gun/ballistic/automatic/nt20::name
	item_path = /obj/item/storage/toolbox/guncase/nova/ntspecial/nt20/with_ammo
	ui_icon = /obj/item/gun/ballistic/automatic/nt20::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/nt20::icon_state

/datum/loadout_item/weapons/long_guns/sol_smg
	name = /obj/item/gun/ballistic/automatic/sol_smg::name
	item_path = /obj/item/storage/toolbox/guncase/nova/carwo_large_case/sindano
	ui_icon = /obj/item/gun/ballistic/automatic/sol_smg::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/sol_smg::icon_state

/datum/loadout_item/weapons/long_guns/sol_rifle
	name = /obj/item/gun/ballistic/automatic/sol_rifle::name
	item_path = /obj/item/storage/toolbox/guncase/nova/carwo_large_case/sol_rifle
	ui_icon = /obj/item/gun/ballistic/automatic/sol_rifle::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/sol_rifle::icon_state

/datum/loadout_item/weapons/long_guns/sol_classic
	name = /obj/item/gun/ballistic/automatic/sol_classic::name
	item_path = /obj/item/storage/toolbox/guncase/nova/carwo_large_case/sol_classic
	ui_icon = /obj/item/gun/ballistic/automatic/sol_classic::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/sol_classic::icon_state

/datum/loadout_item/weapons/long_guns/sol_classic_marksman
	name = /obj/item/gun/ballistic/automatic/sol_classic/marksman::name
	item_path = /obj/item/storage/toolbox/guncase/nova/carwo_large_case/sol_classic_marksman
	ui_icon = /obj/item/gun/ballistic/automatic/sol_classic/marksman::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/sol_classic/marksman::icon_state

/datum/loadout_item/weapons/long_guns/sol_jager
	name = /obj/item/gun/ballistic/shotgun/katyusha/jager::name
	item_path = /obj/item/storage/toolbox/guncase/nova/solfed/sol_jager
	ui_icon = /obj/item/gun/ballistic/shotgun/katyusha/jager::icon
	ui_icon_state = /obj/item/gun/ballistic/shotgun/katyusha/jager::icon_state

/datum/loadout_item/weapons/long_guns/sol_shotgun_super
	name = /obj/item/gun/ballistic/shotgun/riot/sol/super::name
	item_path = /obj/item/storage/toolbox/guncase/nova/solfed/sol_shotgun_super
	ui_icon = /obj/item/gun/ballistic/shotgun/riot/sol/super::icon
	ui_icon_state = /obj/item/gun/ballistic/shotgun/riot/sol/super::icon_state

/datum/loadout_item/weapons/long_guns/rengo
	name = /obj/item/gun/ballistic/rifle/sporterized::name
	item_path = /obj/item/storage/toolbox/guncase/nova/xhihao_large_case/rengo
	ui_icon = /obj/item/gun/ballistic/rifle/sporterized::icon
	ui_icon_state = /obj/item/gun/ballistic/rifle/sporterized::icon_state

/*
*	LASER & ENERGY HANDGUNS
*/

/datum/loadout_item/weapons/energy_handguns
	abstract_type = /datum/loadout_item/weapons/energy_handguns
	group = "Energy Handguns"

/datum/loadout_item/weapons/energy_handguns/mini_e_gun
	name = /obj/item/gun/energy/e_gun/mini::name
	item_path = /obj/item/gun/energy/e_gun/mini

/datum/loadout_item/weapons/energy_handguns/plasma_thrower
	name = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/pistol/plasma_thrower
	ui_icon = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower::icon_state

/datum/loadout_item/weapons/energy_handguns/plasma_marksman
	name = /obj/item/gun/ballistic/automatic/pistol/plasma_marksman::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/pistol/plasma_marksman
	ui_icon = /obj/item/gun/ballistic/automatic/pistol/plasma_marksman::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pistol/plasma_marksman::icon_state

/*
*	LASER & ENERGY LONG GUNS
*/

/datum/loadout_item/weapons/energyguns
	abstract_type = /datum/loadout_item/weapons/energyguns
	group = "Energy Long Guns"

/datum/loadout_item/weapons/energyguns/modular_laser_rifle
	name = /obj/item/gun/energy/modular_laser_rifle::name
	item_path = /obj/item/gun/energy/modular_laser_rifle

/datum/loadout_item/weapons/energyguns/modular_laser_carbine
	name = /obj/item/gun/energy/modular_laser_rifle/carbine::name
	item_path = /obj/item/gun/energy/modular_laser_rifle/carbine

/datum/loadout_item/weapons/energyguns/plasma_pulse
	name = /obj/item/gun/ballistic/automatic/pulse_rifle::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/plasma_pulse
	ui_icon = /obj/item/gun/ballistic/automatic/pulse_rifle::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pulse_rifle::icon_state

/datum/loadout_item/weapons/energyguns/plasma_sniper
	name = /obj/item/gun/ballistic/rifle/pulse_sniper::name
	item_path = /obj/item/storage/toolbox/guncase/nova/green/plasma_sniper
	ui_icon = /obj/item/gun/ballistic/rifle/pulse_sniper::icon
	ui_icon_state = /obj/item/gun/ballistic/rifle/pulse_sniper::icon_state

/*
*	NON-LETHAL WEAPONS
*/

/datum/loadout_item/weapons/nonlethal
	abstract_type = /datum/loadout_item/weapons/nonlethal
	group = "Non-Lethal Weapons"

/datum/loadout_item/weapons/nonlethal/baton
	name = /obj/item/melee/baton::name
	item_path = /obj/item/melee/baton

/datum/loadout_item/weapons/nonlethal/telebaton
	name = /obj/item/melee/baton/telescopic::name
	item_path = /obj/item/melee/baton/telescopic
	ui_icon = /obj/item/melee/baton/telescopic::icon
	ui_icon_state = "telebaton_on"

/datum/loadout_item/weapons/nonlethal/stunbaton
	name = /obj/item/melee/baton/security::name
	item_path = /obj/item/melee/baton/security
	ui_icon = /obj/item/melee/baton/security::icon
	ui_icon_state = "stunbaton_active"

/datum/loadout_item/weapons/nonlethal/stunsword
	name = /obj/item/melee/baton/security/stunsword::name
	item_path = /obj/item/melee/baton/security/stunsword
	ui_icon = /obj/item/melee/baton/security/stunsword::icon
	ui_icon_state = "stunsword_active"

/datum/loadout_item/weapons/nonlethal/cattleprod
	name = /obj/item/melee/baton/security/cattleprod::name
	item_path = /obj/item/melee/baton/security/cattleprod
	ui_icon = /obj/item/melee/baton/security/cattleprod::icon
	ui_icon_state = "stunprod_active"

/datum/loadout_item/weapons/nonlethal/advtaser
	name = /obj/item/gun/energy/e_gun/advtaser::name
	item_path = /obj/item/gun/energy/e_gun/advtaser

/datum/loadout_item/weapons/nonlethal/disabler
	name = /obj/item/gun/energy/disabler::name
	item_path = /obj/item/gun/energy/disabler

/datum/loadout_item/weapons/nonlethal/riot_shotgun
	name = /obj/item/gun/ballistic/shotgun/riot/sol::name
	item_path = /obj/item/storage/toolbox/guncase/nova/solfed/sol_shotgun
	ui_icon = /obj/item/gun/ballistic/shotgun/riot/sol::icon
	ui_icon_state = /obj/item/gun/ballistic/shotgun/riot/sol::icon_state

/datum/loadout_item/weapons/nonlethal/type213
	name = /obj/item/gun/ballistic/automatic/type213::name
	item_path = /obj/item/storage/toolbox/guncase/nova/solfed/type213
	ui_icon = /obj/item/gun/ballistic/automatic/type213::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/type213::icon_state

/datum/loadout_item/weapons/nonlethal/type207
	name = /obj/item/gun/ballistic/automatic/pistol/type207::name
	item_path = /obj/item/storage/toolbox/guncase/nova/solfed/pistol/type207
	ui_icon = /obj/item/gun/ballistic/automatic/pistol/type207::icon
	ui_icon_state = /obj/item/gun/ballistic/automatic/pistol/type207::icon_state

/*
*	MELEE WEAPONS
*/

/datum/loadout_item/weapons/forgeweapons
	group = "Melee Weapons"

/datum/loadout_item/weapons/forgeweapons/sabre
	name = /obj/item/melee/sabre::name
	item_path = /obj/item/storage/belt/sheath/sabre
	ui_icon = /obj/item/melee/sabre::icon
	ui_icon_state = /obj/item/melee/sabre::icon_state

/datum/loadout_item/weapons/forgeweapons/roasting_stick
	name = /obj/item/melee/roastingstick::name
	item_path = /obj/item/melee/roastingstick
	ui_icon = /obj/item/melee/roastingstick::icon
	ui_icon_state = "roastingstick_on"

/datum/loadout_item/weapons/forgeweapons/cleric_mace
	name = /obj/item/melee/cleric_mace::name
	item_path = /obj/item/melee/cleric_mace

/datum/loadout_item/weapons/forgeweapons/surplus_sword
	name = /obj/item/melee/energy/sword/surplus::name
	item_path = /obj/item/melee/energy/sword/surplus
	ui_icon = /obj/item/melee/energy/sword/surplus::icon
	ui_icon_state = "surplus_e_sword_on"

/datum/loadout_item/weapons/forgeweapons/pirate_sword
	name = /obj/item/melee/energy/sword/pirate::name
	item_path = /obj/item/melee/energy/sword/pirate
	ui_icon = /obj/item/melee/energy/sword/pirate::icon
	ui_icon_state = "e_cutlass_on"

/datum/loadout_item/weapons/forgeweapons/energy_sword
	name = /obj/item/melee/energy/sword::name
	item_path = /obj/item/melee/energy/sword
	ui_icon = /obj/item/melee/energy/sword::icon
	ui_icon_state = "e_sword_on"

/datum/loadout_item/weapons/forgeweapons/energy_axe
	name = /obj/item/melee/energy/axe::name
	item_path = /obj/item/melee/energy/axe
	ui_icon = /obj/item/melee/energy/axe::icon
	ui_icon_state = "axe_on"

/datum/loadout_item/weapons/forgeweapons/double_sword
	name = /obj/item/dualsaber::name
	item_path = /obj/item/dualsaber
	ui_icon = /obj/item/dualsaber::icon
	ui_icon_state = "dualsaberred1"

/datum/loadout_item/weapons/forgeweapons/military_spear
	name = /obj/item/spear/military::name
	item_path = /obj/item/spear/military

/datum/loadout_item/weapons/forgeweapons/glass_spear
	name = /obj/item/spear::name
	item_path = /obj/item/spear

/datum/loadout_item/weapons/forgeweapons/knuckle_duster
	name = /obj/item/melee/knuckleduster::name
	item_path = /obj/item/melee/knuckleduster

/datum/loadout_item/weapons/forgeweapons/powerfist
	name = /obj/item/melee/powerfist::name
	item_path = /obj/item/melee/powerfist

/datum/loadout_item/weapons/forgeweapons/combat_knife
	name = /obj/item/knife/combat::name
	item_path = /obj/item/knife/combat

/datum/loadout_item/weapons/forgeweapons/survival_knife
	name = /obj/item/knife/combat/survival::name
	item_path = /obj/item/knife/combat/survival

/datum/loadout_item/weapons/forgeweapons/nunchaku
	name = /obj/item/melee/baton/nunchaku::name
	item_path = /obj/item/melee/baton/nunchaku
