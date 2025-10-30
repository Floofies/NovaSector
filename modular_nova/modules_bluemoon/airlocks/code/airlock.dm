// Bluemoon addition - Custom airlock sounds
/obj/machinery/door/airlock
	var/loud_bolts = FALSE
	var/quiet = TRUE

/obj/machinery/door/airlock
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/airlockclose.ogg'
	boltUp = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/boltsup.ogg'
	boltDown = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/boltsdown.ogg'

/obj/machinery/door/airlock/external
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/deniedbeep.ogg'
	forcedOpen = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/open_force.ogg'
	forcedClosed = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/close_force.ogg'

/obj/machinery/door/airlock/shuttle
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/deniedbeep.ogg'
	forcedOpen = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/open_force.ogg'
	forcedClosed = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/close_force.ogg'

/obj/machinery/door/airlock/titanium
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/external_airlock/deniedbeep.ogg'
	forcedOpen = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/open_force.ogg'
	forcedClosed = 'modular_nova/modules_bluemoon/airlocks/sound/airlock/close_force.ogg'

/obj/machinery/door/airlock/multi_tile
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/airlockclose.ogg'
	forcedOpen = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/open_force.ogg'
	forcedClosed = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/close_force.ogg'

/obj/machinery/door/airlock/vault
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/deniedbeep.ogg'
	forcedOpen = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/open_force.ogg'
	forcedClosed = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/close_force.ogg'

/obj/machinery/door/airlock/command
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/deniedbeep.ogg'

/obj/machinery/door/airlock/security
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/deniedbeep.ogg'

/obj/machinery/door/airlock/colony_prefab
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/deniedbeep.ogg'
	boltUp = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsup.ogg'
	boltDown = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsdown.ogg'
	loud_bolts = TRUE
	quiet = FALSE

/obj/machinery/door/airlock/external/wagon
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/deniedbeep.ogg'
	boltUp = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsup.ogg'
	boltDown = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsdown.ogg'
	opacity = FALSE
	glass = TRUE
	quiet = FALSE

/obj/machinery/door/airlock/external/wagon/command
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/deniedbeep.ogg'

/obj/machinery/door/airlock/shuttle/ferry
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/deniedbeep.ogg'
	boltUp = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsup.ogg'
	boltDown = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsdown.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/vault_airlock/deniedbeep.ogg'
	opacity = FALSE
	glass = TRUE
	quiet = FALSE

/obj/machinery/door/airlock/survival_pod
	doorOpen = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlock.ogg'
	doorClose = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/airlockclose.ogg'
	doorDeni = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/deniedbeep.ogg'
	boltUp = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsup.ogg'
	boltDown = 'modular_nova/modules_bluemoon/airlocks/sound/colony_prefab/boltsdown.ogg'
	quiet = FALSE
