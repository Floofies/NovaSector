/datum/preference/choiced/pet_owner
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "pet_owner"
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE

GLOBAL_LIST_INIT(possible_player_pet, list(
	"Axolotl" = /mob/living/basic/axolotl,
	"Baby Penguin" = /mob/living/basic/pet/penguin/baby/permanent,
	"Bat" = /mob/living/basic/bat,
	"Bull terrier" = /mob/living/basic/pet/dog/bullterrier,
	"Butterfly" = /mob/living/basic/butterfly,
	"Cat" = /mob/living/basic/pet/cat,
	"Chick" = /mob/living/basic/chick/permanent,
	"Chicken" = /mob/living/basic/chicken,
	"Chinchilla (dark)" = /mob/living/basic/pet/chinchilla/black,
	"Chinchilla (white)" = /mob/living/basic/pet/chinchilla/white,
	"Corgi" = /mob/living/basic/pet/dog/corgi,
	"Corgi puppy" = /mob/living/basic/pet/dog/corgi/puppy,
	"Cockroach" = /mob/living/basic/cockroach,
	"Crab" = /mob/living/basic/crab,
	"Deer" = /mob/living/basic/deer,
	"Dobermann" = /mob/living/basic/pet/dog/dobermann,
	"Fox" = /mob/living/basic/pet/fox/docile,
	"Frog" = /mob/living/basic/frog,
	"Giant ant" = /mob/living/basic/ant,
	"Kitten" = /mob/living/basic/pet/cat/kitten,
	"Kiwi" = /mob/living/basic/kiwi,
	"Mothroach" = /mob/living/basic/mothroach,
	"Mouse (white)" = /mob/living/basic/mouse/white,
	"Mouse (gray)" = /mob/living/basic/mouse/gray,
	"Mouse (brown)" = /mob/living/basic/mouse/brown,
	"Penguin" = /mob/living/basic/pet/penguin/emperor/neuter,
	"Pig" = /mob/living/basic/pig,
	"Pug" = /mob/living/basic/pet/dog/pug,
	"Rabbit" = /mob/living/basic/rabbit,
	"Sloth" = /mob/living/basic/sloth,
	"Snake" = /mob/living/basic/snake,
	"Spider" = /mob/living/basic/spider/maintenance,
	"Tegu" = /mob/living/basic/lizard/tegu,
)) //some of these are too big to be put back into the pet carrier once taken out, so I put a warning on the carrier.

/datum/preference/choiced/pet_owner/init_possible_values()
	return list("Random") + assoc_to_keys(GLOB.possible_player_pet)

/datum/preference/choiced/pet_owner/create_default_value()
	return "Random"

/datum/preference/choiced/pet_owner/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Pet Owner" in preferences.all_quirks

/datum/preference/choiced/pet_owner/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/text/pet_name
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "pet_name"
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE
	maximum_value_length = 32

/datum/preference/text/pet_name/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Pet Owner" in preferences.all_quirks

/datum/preference/text/pet_name/serialize(input)
	return htmlrendertext(input)

/datum/preference/text/pet_name/apply_to_human(mob/living/carbon/human/target, value)
	return

/datum/preference/text/pet_desc
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "pet_desc"
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE

/datum/preference/text/pet_desc/is_accessible(datum/preferences/preferences)
	if (!..())
		return FALSE

	return "Pet Owner" in preferences.all_quirks

/datum/preference/text/pet_desc/serialize(input)
	return htmlrendertext(input)

/datum/preference/text/pet_desc/apply_to_human(mob/living/carbon/human/target, value)
	return
