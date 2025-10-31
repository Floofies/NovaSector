// Bluemoon addition - Methane gas
/obj/machinery/portable_atmospherics/canister/methane
	name = "Methane canister"
	gas_type = /datum/gas/methane
	filled = 1
	greyscale_config = /datum/greyscale_config/canister/double_stripe
	greyscale_colors = "#fa6416#d41313"

/obj/machinery/atmospherics/components/tank/methane
	gas_type = /datum/gas/methane

/obj/machinery/atmospherics/miner/methane
	name = "\improper Methane Gas Miner"
	overlay_color = "#ffffff"
	spawn_id = /datum/gas/methane

/obj/machinery/computer/atmos_control/methane_tank
	name = "Methane Supply Control"
	circuit = /obj/item/circuitboard/computer/atmos_control/methane_tank
	atmos_chambers = list(ATMOS_GAS_MONITOR_METHANE = "Methane Supply")

/obj/item/circuitboard/computer/atmos_control/methane_tank
	name = "Methane Supply Control"
	build_path = /obj/machinery/computer/atmos_control/methane_tank

/obj/machinery/air_sensor/methane_tank
	name = "methane tank gas sensor"
	chamber_id = ATMOS_GAS_MONITOR_METHANE

/obj/machinery/atmospherics/components/unary/outlet_injector/monitored/methane_input
	name = "methane tank input injector"

/obj/machinery/atmospherics/components/unary/vent_pump/siphon/monitored/methane_output
	name = "methane tank output inlet"

/obj/machinery/atmospherics/components/trinary/filter/atmos/methane
	name = "methane filter"
	filter_type = list(/datum/gas/methane)

/obj/machinery/atmospherics/components/trinary/filter/atmos/flipped/methane
	name = "methane filter"
	filter_type = list(/datum/gas/methane)
