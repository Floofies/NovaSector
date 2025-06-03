/mob/verb/swap_body()
	set name = "Swap Body"
	set category = "OOC"

	var/list/mob/living/body_list = client.get_bodies()
	if(isnull(body_list))
		to_chat(src, span_danger("You lack another body to swap!"))
		return
	var/mob/living/new_body = tgui_input_list(src, "Select a new body:", "Swap Body", body_list)
	if(isnull(new_body))
		return
	new_body.PossessByPlayer(client.ckey)


