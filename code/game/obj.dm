/obj
	//var/datum/module/mod	//not used
	var/crit_fail = 0
	animate_movement = 2


	var/anchor			// The structure or turf this object is anchored to. If the structure moves, src will too. If anchor is destroyed, the object will no longer be anchored.

	var/in_use = 0		// If we have a user using us, this will be set on. We will check if the user has stopped using us, and thus stop updating and LAGGING EVERYTHING!

/obj/proc/process()
	return

/obj/proc/interact(mob/user)
	return

/obj/proc/update_icon()
	return

/obj/proc/use(var/num)
	return