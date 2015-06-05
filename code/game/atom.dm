/atom
	layer = 2

	var/alt_light = 0 // Replaces Opacity for use in the photon engine. Whether this atom is large enough to be included in photon pathing. Whether it actually blocks light is dependent on its material.
	var/alt_atoms = 0 // Replaced Density for use in the flair engine. Whether this atom is solid enough to be included in object pathing. What it's actually able to block is dependent on other properties.
	var/alt_sound = 0 // Special Blocking for noise and stuff. Used for noise-proofing objects when noise-pathing. How it affects noise is dependent on other properties.

	var/height = 0	// How tall the atom is. This is primarily used for checking whether you can pass over something or not.
	var/mass = 0	// Mass of the object. Used primarily for movement and damage. This SHOULD be calculated by materials, rather than set directly.
	var/aero = 35	// Aerodynamicness of the object. Used by throwing procedures. This is how much of the force that becomes range.
	var/position = CENTER	// Used primarily for wall and border objects. Uses NORTH SOUTH EAST WEST and CENTER, or 1, 2, 4, 8, and 0, respectively.
	var/data

	var/datum/material/material = null


/atom/New(var/loc, var/datum/material/mat)
	..()

/atom/proc/attackby(obj/item/I, mob/user)
	return

/atom/proc/examine(mob/user)
	if(desc)
		user << desc

/atom/proc/Destroy(var/method = 0)

	for (var/atom/movable/A in src)	// Make sure that no atoms or mobs are accidentially deleted by silly destruction procedures.
		A.loc = src.loc

	switch (method)

		if (0)	// Just fucking delete me, trust me, everything else has already been handled.
			del src
			return

		if (1)	// Drop shards, something bashed me until I broke!
			del src
			return new /obj/item/shard(loc, material)

		if (2)	// Crumble to powder, I found a structural failure!
			del src
			return new /obj/powder(loc, material)

		if (3)	// Make a puddle, It's too hot for my materials!
			del src
			return new /obj/puddle(loc, material)

	// LOG("SOMETHING IS TRYING TO DESTROY ITSELF BY DIVIDING BY ZERO!")