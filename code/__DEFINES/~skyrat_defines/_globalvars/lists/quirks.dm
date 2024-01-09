GLOBAL_LIST_INIT(possible_junkie_addictions, list(
	/datum/reagent/drug/blastoff,
	/datum/reagent/drug/krokodil,
	/datum/reagent/medicine/morphine,
	/datum/reagent/drug/happiness,
	/datum/reagent/drug/methamphetamine,
))

GLOBAL_LIST_INIT(possible_smoker_addictions, list(
	/obj/item/storage/fancy/cigarettes,
	/obj/item/storage/fancy/cigarettes/cigpack_midori,
	/obj/item/storage/fancy/cigarettes/cigpack_uplift,
	/obj/item/storage/fancy/cigarettes/cigpack_robust,
	/obj/item/storage/fancy/cigarettes/cigpack_robustgold,
	/obj/item/storage/fancy/cigarettes/cigpack_carp,
	/obj/item/storage/fancy/cigarettes/cigars,
	/obj/item/storage/fancy/cigarettes/cigars/cohiba,
	/obj/item/storage/fancy/cigarettes/cigars/havana,
))

GLOBAL_LIST_INIT(possible_alcoholic_addictions, list(
	/obj/item/reagent_containers/cup/glass/bottle/whiskey,
	/obj/item/reagent_containers/cup/glass/bottle/vodka,
	/obj/item/reagent_containers/cup/glass/bottle/ale,
	/obj/item/reagent_containers/cup/glass/bottle/beer,
	/obj/item/reagent_containers/cup/glass/bottle/hcider,
	/obj/item/reagent_containers/cup/glass/bottle/wine,
	/obj/item/reagent_containers/cup/glass/bottle/sake,
))

GLOBAL_LIST_INIT(possible_chronic_illness, list(
	/datum/disease/chronic_illness,
	/datum/disease/brainrot,
	/datum/disease/fake_gbs,
))

GLOBAL_LIST_INIT(possible_food_allergies, list(
	"Alcohol" = ALCOHOL,
	"Bugs" = BUGS,
	"Dairy" = DAIRY,
	"Fruit" = FRUIT,
	"Grain" = GRAIN,
	"Meat" = MEAT,
	"Nuts" = NUTS,
	"Seafood" = SEAFOOD,
	"Sugar" = SUGAR,
	"Vegetables" = VEGETABLES,
))

#define DEATH_CONSEQUENCES_QUIRK_NAME "Death Degradation Disorder"
#define DEATH_CONSEQUENCES_QUIRK_DESC "Patient is unusually susceptable to mortality."
#define DEATH_CONSEQUENCES_BASE_DEGRADATION_ON_DEATH 50

/// The victim's crit threshold cannot go below this.
#define DEATH_CONSEQUENCES_MINIMUM_VICTIM_CRIT_THRESHOLD (MAX_LIVING_HEALTH) - 1

#define DEATH_CONSEQUENCES_REAGENT_FLAT_AMOUNT "dc_flat_reagent_amount"
#define DEATH_CONSEQUENCES_REAGENT_MULT_AMOUNT "dc_mult_reagent_amount"
#define DEATH_CONSEQUENCES_REAGENT_METABOLIZE "dc_reagent_should_be_metabolizing"
/// If true, we will check to see if this can process. Ex. things like synths wont process formaldehyde
#define DEATH_CONSEQUENCES_REAGENT_CHECK_PROCESSING_FLAGS "dc_check_reagent_processing_flags"

/// Absolute maximum for preferences.
#define DEATH_CONSEQUENCES_MAXIMUM_THEORETICAL_DEGRADATION 10000
#define DEATH_CONSEQUENCES_DEFAULT_MAX_DEGRADATION 500 // arbitrary
#define DEATH_CONSEQUENCES_DEFAULT_LIVING_DEGRADATION_RECOVERY 0.01
#define DEATH_CONSEQUENCES_DEFAULT_DEGRADATION_ON_DEATH 50

#define DEATH_CONSEQUENCES_DEFAULT_REZADONE_DEGRADATION_REDUCTION 0.4
#define DEATH_CONSEQUENCES_DEFAULT_STRANGE_REAGENT_DEGRADATION_REDUCTION 0.25
#define DEATH_CONSEQUENCES_DEFAULT_EIGENSTASIUM_DEGRADATION_REDUCTION 5 // for such a rare chem, you fucking bet
#define DEATH_CONSEQUENCES_DEFAULT_SANSUFENTANYL_DEGRADATION_REDUCTION 1

#define DEATH_CONSEQUENCES_SHOW_HEALTH_ANALYZER_DATA "dc_show_health_analyzer_data"

#define DEATH_CONSEQUENCES_TIME_BETWEEN_REMINDERS 5 MINUTES
