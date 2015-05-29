/obj
	//var/datum/module/mod	//not used
	var/crit_fail = 0
	animate_movement = 2
	var/height = 0		// Related to tables and shit. Measured in thirds of a rooms height. 0 = irrelevant, 1 = table, 2 = barrier, 3 = wall. Smaller creatures and objects can go over larger objects. Nothing can go over a wall.
	var/mass = 1		// Mass * Material Mass = Total Mass. This affects who can carry it, walk-speed, and throwing.
	var/aero = 4.5		// How Aerodynamic the object is. Lets say paper is 1, and a throwing knife is 10.

	var/reliability = 100	//Used by SOME devices to determine how reliable they are.

	var/anchor			// The structure or turf this object is anchored to. If the structure moves, src will too. If anchor is destroyed, the object will no longer be anchored.

	var/in_use = 0		// If we have a user using us, this will be set on. We will check if the user has stopped using us, and thus stop updating and LAGGING EVERYTHING!

/obj/proc/process()
	return

/obj/proc/interact(mob/user)
	return

/obj/proc/update_icon()
	return