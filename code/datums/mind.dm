datum/mind
	var/key
	var/mob/current

	var/memory

	var/assigned_role
	var/special_role

	var/list/datum/objective/objectives = list()

	proc/transfer_to(mob/new_character)
		if(current)
			current.mind = null

		new_character.mind = src
		current = new_character

		new_character.key = key

	proc/store_memory(new_text)
		memory += "[new_text]<BR>"

	proc/show_memory(mob/recipient)
		var/output = "<B>[current.real_name]'s Memory</B><HR>"
		output += memory

		recipient << browse(output,"window=memory")