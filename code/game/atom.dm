/atom
	layer = 2
	var/flags = 0
	var/data
	var/last_bumped = 0
	var/datum/material/material = null


/atom/New(var/loc, var/datum/material/mat)
	..()

/atom/proc/examine(mob/user)
	if(desc)
		user << desc
